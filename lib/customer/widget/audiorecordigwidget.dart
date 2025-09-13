// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/core/utils/appcolor.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:provider/provider.dart';
// import 'package:record/record.dart';

// import 'package:path_provider/path_provider.dart';

// class AudioRecorderWidget extends StatefulWidget {
//   final ValueChanged<String?> onAudioRecorded;
//   final VoidCallback onRemoveAudio;

//   const AudioRecorderWidget({
//     Key? key,
//     required this.onAudioRecorded,
//     required this.onRemoveAudio,
//   }) : super(key: key);

//   @override
//   _AudioRecorderWidgetState createState() => _AudioRecorderWidgetState();
// }

// class _AudioRecorderWidgetState extends State<AudioRecorderWidget> {
//   final AudioPlayer _audioPlayer = AudioPlayer();
//   final AudioRecorder _recorder = AudioRecorder();

//   bool _isRecording = false;
//   String? _filePath;

//   double _currentPosition = 0;
//   double _totalDuration = 0;
//   bool _isPlaying = false;
//   bool _isPaused = false;

//   @override
//   void initState() {
//     super.initState();
//     _setupAudioListeners();
//   }

//   void _setupAudioListeners() {
//     _audioPlayer.positionStream.listen((position) {
//       setState(() {
//         _currentPosition = position.inSeconds.toDouble();
//       });
//     });

//     _audioPlayer.durationStream.listen((duration) {
//       setState(() {
//         _totalDuration = duration?.inSeconds.toDouble() ?? 0;
//       });
//     });

//     _audioPlayer.playerStateStream.listen((state) {
//       if (state.processingState == ProcessingState.completed) {
//         setState(() {
//           _isPlaying = false;
//           _isPaused = true;
//           _currentPosition = _totalDuration; // slider at end
//         });

//         // ✅ stop instead of seek to zero (prevents auto reset)
//         _audioPlayer.stop();
//       } else {
//         setState(() {
//           _isPlaying = state.playing;
//           _isPaused =
//               !state.playing && state.processingState == ProcessingState.ready;
//         });
//       }
//     });
//   }

//   Future<void> _startRecording() async {
//     final bool isPermissionGranted = await _recorder.hasPermission();
//     if (!isPermissionGranted) return;

//     final directory = await getApplicationDocumentsDirectory();
//     String fileName = 'recording_${DateTime.now().millisecondsSinceEpoch}.m4a';
//     _filePath = '${directory.path}/$fileName';

//     // Define the 'config' variable here
//     const config = RecordConfig(
//       encoder: AudioEncoder.aacLc,
//       sampleRate: 44100,
//       bitRate: 128000,
//     );

//     await _recorder.start(config, path: _filePath!);

//     setState(() {
//       _isRecording = true;
//     });
//   }

//   Future<void> _stopRecording() async {
//     await _recorder.stop();
//     setState(() {
//       _isRecording = false;
//     });
//     widget.onAudioRecorded(_filePath);
//   }

//   Future<void> _playRecording() async {
//     if (_filePath != null) {
//       try {
//         await _audioPlayer.setFilePath(_filePath!);
//         await _audioPlayer.play();
//         setState(() {
//           _isPlaying = true;
//           _isPaused = false;
//         });
//         // Optionally, show a success message
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Playing audio...'),
//             duration: Duration(seconds: 1),
//           ),
//         );
//       } catch (e) {
//         // Show a SnackBar on error
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('$e'), duration: Duration(seconds: 3)),
//         );
//         print(
//           "Error playing audio: $e",
//         ); // Still useful for debugging in debug mode
//       }
//     } else {
//       // Handle case where _filePath is null
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('No audio file found to play.'),
//           duration: Duration(seconds: 2),
//         ),
//       );
//     }
//   }

//   Future<void> _pauseRecording() async {
//     if (_audioPlayer.playing) {
//       await _audioPlayer.pause();
//       setState(() {
//         _isPlaying = false;
//         _isPaused = true;
//       });
//     }
//   }

//   void _removeAudio() {
//     setState(() {
//       _filePath = null;
//       _isPlaying = false;
//       _isPaused = false;
//       _currentPosition = 0;
//       _totalDuration = 0;
//     });
//     _audioPlayer.stop();
//     widget.onRemoveAudio();
//   }

//   @override
//   void dispose() {
//     _audioPlayer.dispose();
//     _recorder.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 295,
//       height: 77,
//       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       decoration: BoxDecoration(
//         color: AppColors.white,
//         borderRadius: BorderRadius.circular(6),
//         border: Border.all(color: AppColors.white11, width: 1),
//         boxShadow: const [
//           BoxShadow(
//             color: AppColors.black1A,
//             offset: Offset(1, 5),
//             blurRadius: 8,
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // Record/Stop button
//           GestureDetector(
//             onTap: () {
//               if (_isRecording) {
//                 _stopRecording();
//               } else {
//                 _startRecording();
//               }
//             },
//             child: Container(
//               width: 41,
//               height: 41,
//               padding: const EdgeInsets.all(5),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color:
//                     _isRecording
//                         ? Colors.red.withOpacity(0.2)
//                         : AppColors.redopacity10,
//               ),
//               child: Center(
//                 child:
//                     _isRecording
//                         ? const Icon(Icons.stop, color: Colors.red, size: 24)
//                         : Image.asset(
//                           "assets/audios.png",
//                           width: 20,
//                           height: 20,
//                           fit: BoxFit.contain,
//                           color: AppColors.redEE,
//                         ),
//               ),
//             ),
//           ),

//           const SizedBox(width: 10),

//           if (_filePath != null && !_isRecording) ...[
//             IconButton(
//               icon: Icon(
//                 _isPlaying ? Icons.pause : Icons.play_arrow,
//                 color: Colors.green,
//               ),
//               onPressed: () async {
//                 if (_isPlaying) {
//                   await _audioPlayer.pause();
//                 } else {
//                   if (_filePath != null) {
//                     await _audioPlayer.setFilePath(_filePath!);
//                     await _audioPlayer.play();
//                   }
//                 }
//               },
//             ),

//             // Progress slider
//             Expanded(
//               child: SliderTheme(
//                 data: SliderTheme.of(context).copyWith(
//                   activeTrackColor: Colors.green,
//                   inactiveTrackColor: Colors.green.shade100,
//                   thumbColor: Colors.green,
//                   overlayColor: Colors.green.withOpacity(0.2),
//                   trackHeight: 2.0,
//                   thumbShape: const RoundSliderThumbShape(
//                     enabledThumbRadius: 6.0,
//                   ),
//                 ),
//                 child: Slider(
//                   value: _currentPosition.clamp(0, _totalDuration),
//                   max: _totalDuration > 0 ? _totalDuration : 1,
//                   onChanged: (value) {
//                     setState(() {
//                       _currentPosition = value;
//                     });
//                     _audioPlayer.seek(Duration(seconds: value.toInt()));
//                   },
//                 ),
//               ),
//             ),

//             // Remove audio button
//             IconButton(
//               icon: const Icon(Icons.delete, color: Colors.red),
//               onPressed: _removeAudio,
//             ),
//           ] else if (_isRecording) ...[
//             const Expanded(
//               child: Text(
//                 "Recording...",
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 14,
//                   fontStyle: FontStyle.italic,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ] else ...[
//             const Expanded(
//               child: Text(
//                 "Tap the mic to record",
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 14,
//                   fontStyle: FontStyle.italic,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ],
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';
import 'package:provider/provider.dart';

class AudioRecorderProvider with ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final AudioRecorder _recorder = AudioRecorder();

  bool _isRecording = false;
  String? _filePath;
  double _currentPosition = 0;
  double _totalDuration = 0;
  bool _isPlaying = false;
  bool _isPaused = false;

  bool get isRecording => _isRecording;
  String? get filePath => _filePath;
  double get currentPosition => _currentPosition;
  double get totalDuration => _totalDuration;
  bool get isPlaying => _isPlaying;
  bool get isPaused => _isPaused;

  AudioRecorderProvider() {
    _setupAudioListeners();
  }

  void _setupAudioListeners() {
    _audioPlayer.positionStream.listen((position) {
      _currentPosition = position.inSeconds.toDouble();
      notifyListeners();
    });

    _audioPlayer.durationStream.listen((duration) {
      _totalDuration = duration?.inSeconds.toDouble() ?? 0;
      notifyListeners();
    });

    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        _isPlaying = false;
        _isPaused = true;
        _currentPosition = _totalDuration;
        _audioPlayer.stop();
        notifyListeners();
      } else {
        _isPlaying = state.playing;
        _isPaused =
            !state.playing && state.processingState == ProcessingState.ready;
        notifyListeners();
      }
    });
  }

  Future<void> startRecording() async {
    final bool isPermissionGranted = await _recorder.hasPermission();
    if (!isPermissionGranted) return;

    final directory = await getApplicationDocumentsDirectory();
    String fileName = 'recording_${DateTime.now().millisecondsSinceEpoch}.m4a';
    _filePath = '${directory.path}/$fileName';

    const config = RecordConfig(
      encoder: AudioEncoder.aacLc,
      sampleRate: 44100,
      bitRate: 128000,
    );

    await _recorder.start(config, path: _filePath!);

    _isRecording = true;
    notifyListeners();
  }

  Future<void> stopRecording() async {
    await _recorder.stop();
    _isRecording = false;
    notifyListeners();
  }

  Future<void> playRecording() async {
    if (_filePath != null) {
      try {
        await _audioPlayer.setFilePath(_filePath!);
        await _audioPlayer.play();
        _isPlaying = true;
        _isPaused = false;
        notifyListeners();
      } catch (e) {
        rethrow;
      }
    }
  }

  Future<void> pauseRecording() async {
    if (_audioPlayer.playing) {
      await _audioPlayer.pause();
      _isPlaying = false;
      _isPaused = true;
      notifyListeners();
    }
  }

  void removeAudio() {
    _filePath = null;
    _isPlaying = false;
    _isPaused = false;
    _currentPosition = 0;
    _totalDuration = 0;
    _audioPlayer.stop();
    notifyListeners();
  }

  void seekAudio(double value) {
    _currentPosition = value;
    _audioPlayer.seek(Duration(seconds: value.toInt()));
    notifyListeners();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    _recorder.dispose();
    super.dispose();
  }
}

class AudioRecorderWidget extends StatefulWidget {
  final ValueChanged<String?> onAudioRecorded;
  final VoidCallback onRemoveAudio;

  const AudioRecorderWidget({
    Key? key,
    required this.onAudioRecorded,
    required this.onRemoveAudio,
  }) : super(key: key);

  @override
  _AudioRecorderWidgetState createState() => _AudioRecorderWidgetState();
}

class _AudioRecorderWidgetState extends State<AudioRecorderWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AudioRecorderProvider(),
      child: Consumer<AudioRecorderProvider>(
        builder: (context, audioProvider, child) {
          return Container(
            width: 295,
            height: 77,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: AppColors.white11, width: 1),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.black1A,
                  offset: Offset(1, 5),
                  blurRadius: 8,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Record/Stop button
                GestureDetector(
                  onTap: () async {
                    if (audioProvider.isRecording) {
                      await audioProvider.stopRecording();
                      widget.onAudioRecorded(audioProvider.filePath);
                    } else {
                      await audioProvider.startRecording();
                    }
                  },
                  child: Container(
                    width: 41,
                    height: 41,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color:
                          audioProvider.isRecording
                              ? Colors.red.withOpacity(0.2)
                              : AppColors.redopacity10,
                    ),
                    child: Center(
                      child:
                          audioProvider.isRecording
                              ? const Icon(
                                Icons.stop,
                                color: Colors.red,
                                size: 24,
                              )
                              : Image.asset(
                                "assets/audios.png",
                                width: 20,
                                height: 20,
                                fit: BoxFit.contain,
                                color: AppColors.redEE,
                              ),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                if (audioProvider.filePath != null &&
                    !audioProvider.isRecording) ...[
                  IconButton(
                    icon: Icon(
                      audioProvider.isPlaying ? Icons.pause : Icons.play_arrow,
                      color: Colors.green,
                    ),
                    onPressed: () async {
                      if (audioProvider.isPlaying) {
                        await audioProvider.pauseRecording();
                      } else {
                        try {
                          await audioProvider.playRecording();
                          // Optionally, show a success message
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Playing audio...'),
                              duration: Duration(seconds: 1),
                            ),
                          );
                        } catch (e) {
                          // Show a SnackBar on error
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('$e'),
                              duration: const Duration(seconds: 3),
                            ),
                          );
                        }
                      }
                    },
                  ),

                  // Progress slider
                  Expanded(
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.green,
                        inactiveTrackColor: Colors.green.shade100,
                        thumbColor: Colors.green,
                        overlayColor: Colors.green.withOpacity(0.2),
                        trackHeight: 2.0,
                        thumbShape: const RoundSliderThumbShape(
                          enabledThumbRadius: 6.0,
                        ),
                      ),
                      child: Slider(
                        value: audioProvider.currentPosition.clamp(
                          0,
                          audioProvider.totalDuration,
                        ),
                        max:
                            audioProvider.totalDuration > 0
                                ? audioProvider.totalDuration
                                : 1,
                        onChanged: (value) {
                          audioProvider.seekAudio(value);
                        },
                      ),
                    ),
                  ),

                  // Remove audio button
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      audioProvider.removeAudio();
                      widget.onRemoveAudio();
                    },
                  ),
                ] else if (audioProvider.isRecording) ...[
                  const Expanded(
                    child: Text(
                      "Recording...",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ] else ...[
                  const Expanded(
                    child: Text(
                      "Tap the mic to record",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
