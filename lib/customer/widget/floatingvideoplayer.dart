import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FloatingVideoPlayer extends StatefulWidget {
  final File videoFile;

  const FloatingVideoPlayer({super.key, required this.videoFile});

  @override
  State<FloatingVideoPlayer> createState() => _FloatingVideoPlayerState();
}

class _FloatingVideoPlayerState extends State<FloatingVideoPlayer> {
  late VideoPlayerController _videoController;
  ChewieController? _chewieController;
  bool _isInitialized = false;
  bool _hasError = false;

  // Position of floating player
  Offset position = const Offset(20, 100);

  @override
  void initState() {
    super.initState();
    _initVideo();
  }

  Future<void> _initVideo() async {
    try {
      _videoController = VideoPlayerController.file(widget.videoFile);
      await _videoController.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoController,
        autoPlay: true,
        looping: true,
        allowFullScreen: true,
        allowMuting: true,
        allowPlaybackSpeedChanging: true,
        materialProgressColors: ChewieProgressColors(
          playedColor: Colors.red,
          handleColor: Colors.redAccent,
          bufferedColor: Colors.grey,
          backgroundColor: Colors.white24,
        ),
      );

      setState(() => _isInitialized = true);
    } catch (e) {
      setState(() => _hasError = true);
    }
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return const Center(
        child: Icon(Icons.error, color: Colors.red, size: 48),
      );
    }

    if (!_isInitialized || _chewieController == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Stack(
      children: [
        Draggable(
          feedback: _buildPlayerUI(),
          childWhenDragging: Container(),
          onDragEnd: (details) {
            setState(() {
              position = details.offset;
            });
          },
          child: _buildPlayerUI(),
        ),
      ],
    );
  }

  Widget _buildPlayerUI() {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 280,
        height: 160,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Chewie(controller: _chewieController!),
            ),
            Positioned(
              top: 4,
              left: 8,
              right: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Video",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
