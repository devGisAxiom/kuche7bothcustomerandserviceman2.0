// import 'package:flutter/material.dart';
// import 'package:just_audio/just_audio.dart';

// class AudioMessagePlayer extends StatefulWidget {
//   final String url; // audio file URL

//   const AudioMessagePlayer({super.key, required this.url});

//   @override
//   State<AudioMessagePlayer> createState() => _AudioMessagePlayerState();
// }

// class _AudioMessagePlayerState extends State<AudioMessagePlayer> {
//   late final AudioPlayer _player;
//   bool isBuffering = true;

//   @override
//   void initState() {
//     super.initState();
//     _player = AudioPlayer();
//     _init();
//   }

//   Future<void> _init() async {
//     try {
//       // Load audio from URL
//       await _player.setUrl(widget.url);

//       if (!mounted) return;
//       setState(() => isBuffering = false);

//       // Listen to completion to reset automatically
//       _player.playerStateStream.listen((state) {
//         if (!mounted) return;
//         if (state.processingState == ProcessingState.completed) {
//           _player.seek(Duration.zero); // Reset position
//           _player.pause(); // Ensure state is paused so it can play again
//           setState(() {}); // Update UI
//         }
//       });
//     } catch (e) {
//       debugPrint("Audio load error: $e");
//     }
//   }

//   @override
//   void dispose() {
//     _player.dispose();
//     super.dispose();
//   }

//   Future<void> _togglePlayPause() async {
//     if (isBuffering) return;

//     if (_player.playing) {
//       await _player.pause();
//     } else {
//       // If completed, it has been reset to 0
//       await _player.play();
//     }

//     setState(() {}); // Update UI
//   }

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<Duration?>(
//       stream: _player.positionStream,
//       builder: (context, snapshot) {
//         final position = snapshot.data ?? Duration.zero;
//         final duration = _player.duration ?? Duration(seconds: 1);

//         return Container(
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//           decoration: BoxDecoration(
//             color: Colors.grey.shade200,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Row(
//             children: [
//               IconButton(
//                 icon:
//                     isBuffering
//                         ? const SizedBox(
//                           width: 24,
//                           height: 24,
//                           child: CircularProgressIndicator(strokeWidth: 2),
//                         )
//                         : Icon(
//                           _player.playing ? Icons.pause : Icons.play_arrow,
//                         ),
//                 onPressed: _togglePlayPause,
//               ),
//               Expanded(
//                 child: Slider(
//                   value: position.inSeconds.toDouble(),
//                   max: duration.inSeconds.toDouble(),
//                   onChanged: (value) async {
//                     await _player.seek(Duration(seconds: value.toInt()));
//                   },
//                 ),
//               ),
//               Text(_formatTime(position), style: const TextStyle(fontSize: 12)),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   String _formatTime(Duration d) {
//     String twoDigits(int n) => n.toString().padLeft(2, "0");
//     final minutes = twoDigits(d.inMinutes.remainder(60));
//     final seconds = twoDigits(d.inSeconds.remainder(60));
//     return "$minutes:$seconds";
//   }
// }
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';

class AudioPlayerProvider with ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();
  bool _isBuffering = true;
  bool _hasError = false;
  String? _currentUrl;
  Duration _position = Duration.zero;
  Duration? _duration;
  String? _errorMessage;

  bool get isBuffering => _isBuffering;
  bool get isPlaying => _player.playing;
  bool get hasError => _hasError;
  String? get errorMessage => _errorMessage;
  Duration get position => _position;
  Duration? get duration => _duration;
  String? get currentUrl => _currentUrl;

  AudioPlayerProvider() {
    _setupListeners();
  }

  void _setupListeners() {
    // Listen to position changes
    _player.positionStream.listen((position) {
      _position = position;
      notifyListeners();
    });

    // Listen to duration changes
    _player.durationStream.listen((duration) {
      _duration = duration;
      notifyListeners();
    });

    // Listen to player state changes
    _player.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        _player.seek(Duration.zero);
        _player.pause();
        notifyListeners();
      }

      // Update buffering state
      if (state.processingState == ProcessingState.buffering) {
        _isBuffering = true;
        _hasError = false;
        notifyListeners();
      } else if (state.processingState == ProcessingState.ready) {
        _isBuffering = false;
        _hasError = false;
        notifyListeners();
      }
    });

    // Listen to errors
    _player.playbackEventStream.listen(
      (event) {},
      onError: (error) {
        _handleError(error);
      },
    );
  }

  void _handleError(dynamic error) {
    _isBuffering = false;
    _hasError = true;

    if (error is PlayerInterruptedException) {
      _errorMessage = 'Playback interrupted';
    } else if (error is PlayerException) {
      _errorMessage = 'Error code: ${error.code}\n${error.message}';
    } else {
      _errorMessage = error.toString();
    }

    debugPrint("Audio player error: $error");
    notifyListeners();
  }

  Future<void> loadAudio(String url) async {
    if (_currentUrl == url && !_isBuffering && !_hasError) return;

    _isBuffering = true;
    _hasError = false;
    _errorMessage = null;
    _currentUrl = url;
    notifyListeners();

    try {
      await _player.setUrl(url);
      _isBuffering = false;
      notifyListeners();
    } catch (e) {
      _handleError(e);
    }
  }

  Future<void> togglePlayPause() async {
    if (_isBuffering || _hasError) return;

    try {
      if (_player.playing) {
        await _player.pause();
      } else {
        // If we're at the end, restart from beginning
        if (_position >= (_duration ?? Duration.zero)) {
          await _player.seek(Duration.zero);
        }
        await _player.play();
      }
      notifyListeners();
    } catch (e) {
      _handleError(e);
    }
  }

  Future<void> seek(Duration position) async {
    if (_hasError) return;

    try {
      await _player.seek(position);
    } catch (e) {
      _handleError(e);
    }
  }

  Future<void> retry() async {
    if (_currentUrl != null) {
      await loadAudio(_currentUrl!);
    }
  }

  Future<void> disposePlayer() async {
    await _player.dispose();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
}

class AudioMessagePlayer extends StatefulWidget {
  final String url; // audio file URL

  const AudioMessagePlayer({super.key, required this.url});

  @override
  State<AudioMessagePlayer> createState() => _AudioMessagePlayerState();
}

class _AudioMessagePlayerState extends State<AudioMessagePlayer> {
  @override
  void initState() {
    super.initState();
    // Load the audio when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<AudioPlayerProvider>(context, listen: false);
      provider.loadAudio(widget.url);
    });
  }

  @override
  void didUpdateWidget(covariant AudioMessagePlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reload audio if URL changed
    if (oldWidget.url != widget.url) {
      final provider = Provider.of<AudioPlayerProvider>(context, listen: false);
      provider.loadAudio(widget.url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioPlayerProvider>(
      builder: (context, audioProvider, child) {
        // Show error state if there's an error
        if (audioProvider.hasError) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.refresh, color: Colors.red),
                  onPressed: () => audioProvider.retry(),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    audioProvider.errorMessage ?? 'Playback error',
                    style: const TextStyle(fontSize: 12, color: Colors.red),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          );
        }

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              IconButton(
                icon:
                    audioProvider.isBuffering
                        ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                        : Icon(
                          audioProvider.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.green,
                        ),
                onPressed:
                    audioProvider.isBuffering
                        ? null
                        : () => audioProvider.togglePlayPause(),
              ),
              Expanded(
                child: Slider(
                  activeColor: Colors.green,
                  inactiveColor: Colors.grey,
                  value: audioProvider.position.inSeconds.toDouble(),
                  max: (audioProvider.duration?.inSeconds.toDouble() ?? 1.0),
                  onChanged: (value) async {
                    await audioProvider.seek(Duration(seconds: value.toInt()));
                  },
                ),
              ),
              Text(
                _formatTime(audioProvider.position),
                style: const TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ],
          ),
        );
      },
    );
  }

  String _formatTime(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
