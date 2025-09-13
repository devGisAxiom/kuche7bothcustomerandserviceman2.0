// import 'dart:convert';
import 'dart:io';

// import 'package:chewie/chewie.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/core/storage/usepreference.dart';
// import 'package:flutter_application_1/customer/api/createservicerequestapi.dart';
// import 'package:flutter_application_1/customer/model/createservicerequest.dart';
import 'package:flutter_application_1/customer/povider/createservicerequestprovider.dart';
import 'package:flutter_application_1/customer/povider/themeprovider.dart';
import 'package:flutter_application_1/customer/widget/attachmenttile.dart';
import 'package:flutter_application_1/customer/widget/audiorecordigwidget.dart';
import 'package:flutter_application_1/customer/widget/floatingvideoplayer.dart';
// import 'package:just_audio/just_audio.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

// import 'package:record/record.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_application_1/customer/widget/loginbutton.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;

class CreateServiceForm extends StatefulWidget {
  final VoidCallback onCancel;
  const CreateServiceForm({required this.onCancel});

  @override
  _CreateServiceFormState createState() => _CreateServiceFormState();
}

class _CreateServiceFormState extends State<CreateServiceForm> {
  String? _audioFilePath;
  bool _showAudioRecorder = false;

  void _handleAudioRecorded(String? filePath) {
    setState(() {
      _audioFilePath = filePath;
    });
  }

  void _handleRemoveAudio() {
    setState(() {
      _audioFilePath = null;
      _showAudioRecorder = false;
    });
  }

  void _startAudioRecording() {
    setState(() {
      _showAudioRecorder = true;
    });
  }

  List<File> selectedImages = [];
  List<File> selectedVideos = [];

  Future<void> pickMultipleImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
    );

    if (result != null) {
      setState(() {
        selectedImages.addAll(result.paths.map((path) => File(path!)).toList());
      });
    }
  }

  Future<void> pickMultipleVideos() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: true,
      allowedExtensions: ['mp4', 'mov', 'avi', 'mkv'],
    );

    if (result != null) {
      setState(() {
        selectedVideos.addAll(result.paths.map((path) => File(path!)).toList());
      });
    }
  }

  final TextEditingController _noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final bannerImage = themeProvider.bannerImage ?? "";
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(6),
            boxShadow: const [
              BoxShadow(
                color: AppColors.black10,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    'Product:',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      height: 1.0,
                      letterSpacing: -0.3,
                      color: AppColors.black12,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    themeProvider.brandName ?? "Default Brand",
                    style: GoogleFonts.poppins(
                      color: AppColors.redEE,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: widget.onCancel,
                    icon: const Icon(Icons.close, color: AppColors.black),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text('Note', style: GoogleFonts.poppins(color: AppColors.black)),
              const SizedBox(height: 5),
              Container(
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.greyShade300),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: TextField(
                  style: TextStyle(color: Colors.black), // Add this line
                  controller: _noteController,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(8),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Attachment',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  height: 1.0,
                  letterSpacing: -0.3,
                  color: AppColors.black12,
                ),
              ),
              const SizedBox(height: 20),

              // Image attachment
              // AttachmentTile(
              //   assetPath: 'assets/imgages.png',
              //   label: 'Image',
              //   onTap: () {
              //     // Handle image attachment

              //   },
              // ),
              AttachmentTile(
                assetPath: 'assets/imgages.png',
                label: 'Image',
                onTap: pickMultipleImages,
              ),
              const SizedBox(height: 10),

              Wrap(
                spacing: 22,
                runSpacing: 22,
                children:
                    selectedImages.asMap().entries.map((entry) {
                      int index = entry.key;
                      File file = entry.value;

                      return Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              // ✅ Show popup dialog with full image
                              showDialog(
                                context: context,
                                builder:
                                    (_) => Dialog(
                                      backgroundColor: Colors.transparent,
                                      insetPadding: EdgeInsets.all(10),
                                      child: GestureDetector(
                                        onTap:
                                            () => Navigator.pop(
                                              context,
                                            ), // close on tap
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          child: Image.file(
                                            file,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                file,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 2,
                            right: 2,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedImages.removeAt(index);
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  shape: BoxShape.circle,
                                ),
                                padding: const EdgeInsets.all(2),
                                child: const Icon(
                                  Icons.close,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
              ),

              const SizedBox(height: 10),
              // Video attachment
              AttachmentTile(
                assetPath: 'assets/videos.png',
                label: 'Video',
                onTap: () {
                  // Handle video attachment
                  pickMultipleVideos();
                },
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 22,
                runSpacing: 22,
                children:
                    selectedVideos.asMap().entries.map((entry) {
                      int index = entry.key;
                      File file = entry.value;

                      return Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showGeneralDialog(
                                context: context,
                                barrierDismissible: true,
                                barrierLabel: "Dismiss", // 👈 required
                                barrierColor: Colors.black.withOpacity(
                                  0.5,
                                ), // background dim
                                pageBuilder: (_, __, ___) {
                                  return Center(
                                    child: FloatingVideoPlayer(videoFile: file),
                                  );
                                },
                              );
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child:
                              // Container(
                              //   width: 80,
                              //   height: 80,
                              //   color: Colors.grey,
                              //   child: const Icon(
                              //     Icons.play_circle_fill,
                              //     color: Colors.white,
                              //     size: 40,
                              //   ),
                              // ),
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image:
                                      bannerImage != null &&
                                              bannerImage.isNotEmpty
                                          ? DecorationImage(
                                            image: NetworkImage(bannerImage),
                                            fit: BoxFit.cover,
                                          )
                                          : null,
                                  color:
                                      (bannerImage == null ||
                                              bannerImage.isEmpty)
                                          ? Colors
                                              .grey // fallback if no image
                                          : null,
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.play_circle_fill,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 2,
                            right: 2,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedVideos.removeAt(index);
                                });
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.black54,
                                  shape: BoxShape.circle,
                                ),
                                padding: const EdgeInsets.all(2),
                                child: const Icon(
                                  Icons.close,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
              ),

              const SizedBox(height: 10),
              // Audio attachment
              _showAudioRecorder || _audioFilePath != null
                  ? AudioRecorderWidget(
                    onAudioRecorded: _handleAudioRecorded,
                    onRemoveAudio: _handleRemoveAudio,
                  )
                  : AttachmentTile(
                    assetPath: 'assets/audios.png',
                    label: 'Audio',
                    onTap: _startAudioRecording,
                  ),
            ],
          ),
        ),
        const SizedBox(height: 20),

        PrimaryButton(
          backgroundColor: theme.colorScheme.primary,
          label: 'Submit',
          textColor: theme.colorScheme.onPrimary,
          onPressed: () async {
            final provider = Provider.of<ServiceRequestProvider>(
              context,
              listen: false,
            );

            // Show loading snackbar
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: AppColors.black, // Dark background
                content: Text(
                  "⏳ Loading, please wait...",
                  style: TextStyle(color: Colors.white),
                ),
                duration: Duration(hours: 1), // stays until hidden
              ),
            );

            // Prepare audio list
            List<File> audioFiles = [];
            if (_audioFilePath != null) {
              audioFiles.add(File(_audioFilePath!));
            }

            // Call API
            await provider.createService(
              note: _noteController.text.trim(),
              images: selectedImages,
              audios: audioFiles,
              videos: selectedVideos,
              idProduct: themeProvider.idProduct ?? 0, // 👈 added
            );

            if (!mounted) return;

            // Hide loading snackbar
            ScaffoldMessenger.of(context).hideCurrentSnackBar();

            // ✅ Handle response
            if (provider.response != null &&
                provider.response!.status == "success") {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    "✅ ${provider.response!.message}",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              );

              // Close after short delay
              Future.delayed(const Duration(milliseconds: 500), () {
                if (mounted) widget.onCancel();
              });
            } else if (provider.response != null &&
                provider.response!.status == "error") {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("❌ ${provider.response!.message}")),
              );
            } else if (provider.error != null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("⚠️ ${provider.error}")));
            }
          },
        ),
      ],
    );
  }
}
