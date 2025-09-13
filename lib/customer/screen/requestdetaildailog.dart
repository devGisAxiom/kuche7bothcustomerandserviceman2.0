import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';
import 'package:flutter_application_1/customer/model/servicelistmodel.dart';
import 'package:flutter_application_1/customer/widget/attachmenttile.dart';
import 'package:flutter_application_1/customer/widget/floatingvideoplayer.dart';
import 'package:flutter_application_1/customer/widget/loginbutton.dart';
import 'package:flutter_application_1/customer/widget/audioplayer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class RequestDetailDialog extends StatelessWidget {
  final int requestId;
  final List<Data> allRequests;

  const RequestDetailDialog({
    super.key,
    required this.requestId,
    required this.allRequests,
  });

  @override
  Widget build(BuildContext context) {
    final request = allRequests.firstWhere(
      (r) => r.id == requestId,
      orElse: () => Data(),
    );
    return Dialog(
      backgroundColor: AppColors.transparent,
      insetPadding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Main Dialog Container
          Container(
            width: 339,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: const [
                BoxShadow(
                  color: AppColors.black1A,
                  blurRadius: 8,
                  offset: Offset(1, 5),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min, // Adjust height to content
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        "ID :",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.0, // 100% line-height
                          letterSpacing: -0.3,
                          color: AppColors.grey545562,
                        ),
                      ),

                      const SizedBox(width: 4),
                      Text(
                        "K7-$requestId",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          height: 1.0, // 100% line-height
                          letterSpacing: 0, // 0% letter-spacing
                          color:
                              AppColors
                                  .redEE, // text color (matches your background in CSS)
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  Text(
                    "Note",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400, // Regular
                      height: 1.0, // line-height: 100%
                      letterSpacing: -0.3, // -0.3px
                      color: AppColors.grey545562,
                      // for visible contrast if background is dark
                    ),
                  ),

                  const SizedBox(height: 16),

                  Container(
                    padding: const EdgeInsets.all(12),
                    width: double.infinity,
                    constraints: const BoxConstraints(
                      minHeight: 80, // default size
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.greyShade300),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      request.note ?? "No note provided.",

                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.3, // better readability
                        letterSpacing: 0,
                        color: AppColors.gry,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  if (request.files != null && request.files!.isNotEmpty) ...[
                    Text(
                      "Attachments",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.0,
                        letterSpacing: -0.3,
                        color: AppColors.black000,
                      ),
                    ),
                    const SizedBox(height: 16),

                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children:
                          request.files!
                              .where(
                                (file) => file.fileType != "audios",
                              ) // 👈 filter out audios
                              .map((file) {
                                bool isVideo = file.fileType == "videos";
                                bool isImage = file.fileType == "images";

                                return attachmentTile(
                                  context,
                                  file.file ?? "",
                                  file.file?.split('/').last ?? "File",
                                  isVideo: isVideo,
                                  onTap: () {
                                    if (isVideo && file.file != null) {
                                      showGeneralDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        barrierLabel: "Dismiss",
                                        barrierColor: Colors.black.withOpacity(
                                          0.5,
                                        ),
                                        pageBuilder: (_, __, ___) {
                                          return Center(
                                            child: NetworkVideoPlayer(
                                              videoUrl: file.file!,
                                            ),
                                          );
                                        },
                                      );
                                    } else if (isImage && file.file != null) {
                                      // Navigator.push(
                                      //   context,
                                      //   // MaterialPageRoute(
                                      //   //   builder: (_) => ImageViewerScreen(imageUrl: file.file!),
                                      //   // ),
                                      // );
                                    }
                                  },
                                );
                              })
                              .toList(),
                    ),

                    const SizedBox(height: 20),

                    if (request.files!.any(
                      (file) => file.fileType == "audios",
                    )) ...[
                      //const SizedBox(height: 8),
                      Column(
                        children:
                            request.files!
                                .where((file) => file.fileType == "audios")
                                .map(
                                  (file) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 4,
                                    ),
                                    child: AudioMessagePlayer(
                                      url: file.file ?? "",
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ],

                  const SizedBox(height: 20), // space above button

                  PrimaryButton(
                    label: 'Cancel Request',
                    onPressed: () {},
                    backgroundColor: AppColors.grey7F,
                  ),
                ],
              ),
            ),
          ),

          // Floating Close Button
          Positioned(
            top: -55,
            right: -2,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: 40,
                height: 40,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.colorswhhite,
                  borderRadius: BorderRadius.circular(200),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.black1A,
                      offset: Offset(1, 5),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.close,
                  size: 20,
                  color: AppColors.black000,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class NetworkVideoPlayer extends StatefulWidget {
//   final String videoUrl; // ✅ network video URL

//   const NetworkVideoPlayer({super.key, required this.videoUrl});

//   @override
//   State<NetworkVideoPlayer> createState() => _NetworkVideoPlayerState();
// }

// class _NetworkVideoPlayerState extends State<NetworkVideoPlayer> {
//   late VideoPlayerController _videoController;
//   ChewieController? _chewieController;
//   bool _isInitialized = false;
//   bool _hasError = false;

//   Offset position = const Offset(20, 100);

//   @override
//   void initState() {
//     super.initState();
//     _initVideo();
//   }

//   Future<void> _initVideo() async {
//     try {
//       _videoController = VideoPlayerController.networkUrl(
//         Uri.parse(widget.videoUrl),
//       );

//       await _videoController.initialize();

//       _chewieController = ChewieController(
//         videoPlayerController: _videoController,
//         autoPlay: true,
//         looping: true,
//         allowFullScreen: true,
//         allowMuting: true,
//         allowPlaybackSpeedChanging: true,
//         materialProgressColors: ChewieProgressColors(
//           playedColor: Colors.red,
//           handleColor: Colors.redAccent,
//           bufferedColor: Colors.grey,
//           backgroundColor: Colors.white24,
//         ),
//       );

//       setState(() => _isInitialized = true);
//     } catch (e) {
//       debugPrint("Video init error: $e");
//       setState(() => _hasError = true);
//     }
//   }

//   @override
//   void dispose() {
//     _videoController.dispose();
//     _chewieController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (_hasError) {
//       return const Center(
//         child: Icon(Icons.error, color: Colors.red, size: 48),
//       );
//     }

//     if (!_isInitialized || _chewieController == null) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     return Stack(
//       children: [
//         Positioned(
//           left: position.dx,
//           top: position.dy,
//           child: Draggable(
//             feedback: _buildPlayerUI(),
//             childWhenDragging: Container(),
//             onDragEnd: (details) {
//               setState(() {
//                 position = details.offset;
//               });
//             },
//             child: _buildPlayerUI(),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildPlayerUI() {
//     return Material(
//       elevation: 8,
//       borderRadius: BorderRadius.circular(12),
//       child: Container(
//         width: 280,
//         height: 160,
//         decoration: BoxDecoration(
//           color: Colors.black,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Chewie(controller: _chewieController!),
//             ),
//             Positioned(
//               top: 4,
//               left: 8,
//               right: 8,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     "Network Video",
//                     style: TextStyle(color: Colors.white, fontSize: 12),
//                   ),
//                   IconButton(
//                     padding: EdgeInsets.zero,
//                     icon: const Icon(
//                       Icons.close,
//                       color: Colors.white,
//                       size: 20,
//                     ),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class VideoPlayerProvider with ChangeNotifier {
  VideoPlayerController? _videoController;
  ChewieController? _chewieController;
  bool _isInitialized = false;
  bool _hasError = false;
  String? _currentVideoUrl;

  VideoPlayerController? get videoController => _videoController;
  ChewieController? get chewieController => _chewieController;
  bool get isInitialized => _isInitialized;
  bool get hasError => _hasError;
  String? get currentVideoUrl => _currentVideoUrl;

  Future<void> initializeVideo(String videoUrl) async {
    if (_currentVideoUrl == videoUrl && _isInitialized) return;

    _currentVideoUrl = videoUrl;
    _isInitialized = false;
    _hasError = false;

    // Dispose previous controllers if they exist
    _chewieController?.dispose();
    _videoController?.dispose();

    notifyListeners();

    try {
      _videoController = VideoPlayerController.networkUrl(Uri.parse(videoUrl));

      await _videoController!.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _videoController!,
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

      _isInitialized = true;
      notifyListeners();
    } catch (e) {
      debugPrint("Video init error: $e");
      _hasError = true;
      notifyListeners();
      rethrow;
    }
  }

  void togglePlayPause() {
    if (_videoController != null) {
      if (_videoController!.value.isPlaying) {
        _videoController!.pause();
      } else {
        _videoController!.play();
      }
      notifyListeners();
    }
  }

  void disposeControllers() {
    _chewieController?.dispose();
    _videoController?.dispose();
    _chewieController = null;
    _videoController = null;
    _isInitialized = false;
    _hasError = false;
    _currentVideoUrl = null;
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }
}

class NetworkVideoPlayer extends StatefulWidget {
  final String videoUrl;

  const NetworkVideoPlayer({super.key, required this.videoUrl});

  @override
  State<NetworkVideoPlayer> createState() => _NetworkVideoPlayerState();
}

class _NetworkVideoPlayerState extends State<NetworkVideoPlayer> {
  Offset position = const Offset(20, 100);

  @override
  void initState() {
    super.initState();
    // Initialize video when widget is created
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<VideoPlayerProvider>(context, listen: false);
      provider.initializeVideo(widget.videoUrl);
    });
  }

  @override
  void didUpdateWidget(covariant NetworkVideoPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reinitialize if video URL changes
    if (oldWidget.videoUrl != widget.videoUrl) {
      final provider = Provider.of<VideoPlayerProvider>(context, listen: false);
      provider.initializeVideo(widget.videoUrl);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<VideoPlayerProvider>(
      builder: (context, videoProvider, child) {
        if (videoProvider.hasError) {
          return const Center(
            child: Icon(Icons.error, color: Colors.red, size: 48),
          );
        }

        if (!videoProvider.isInitialized ||
            videoProvider.chewieController == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return Stack(
          children: [
            Positioned(
              left: position.dx,
              top: position.dy,
              child: Draggable(
                feedback: _buildPlayerUI(videoProvider),
                childWhenDragging: Container(),
                onDragEnd: (details) {
                  setState(() {
                    position = details.offset;
                  });
                },
                child: _buildPlayerUI(videoProvider),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildPlayerUI(VideoPlayerProvider videoProvider) {
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
              child: Chewie(controller: videoProvider.chewieController!),
            ),
            Positioned(
              top: 4,
              left: 8,
              right: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Network Video",
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

  @override
  void dispose() {
    // Don't dispose the provider here as it might be used by other widgets
    // The provider will be disposed by the parent widget that created it
    super.dispose();
  }
}
