// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/core/utils/appcolor.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';
import 'package:flutter_application_1/customer/povider/themeprovider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AttachmentTile extends StatelessWidget {
  final String assetPath;
  final String label;
  final VoidCallback onTap;
  final bool showAddIcon;

  const AttachmentTile({
    Key? key,
    required this.assetPath,
    required this.label,
    required this.onTap,
    this.showAddIcon = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 295,
        height: 66,
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
            Row(
              children: [
                Container(
                  width: 46,
                  height: 46,
                  padding: const EdgeInsets.fromLTRB(3, 5, 3, 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        themeProvider.brandName == "Ventura"
                            ? Colors.white
                            : theme.colorScheme.secondary,
                    // AppColors.redopacity10,
                  ),
                  child: Center(
                    child: Image.asset(
                      assetPath,
                      width: 20,
                      height: 20,
                      fit: BoxFit.contain,
                      color: theme.colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.0,
                    letterSpacing: -0.3,
                    color: AppColors.black,
                  ),
                ),
              ],
            ),
            if (showAddIcon)
              const Icon(Icons.add, size: 20, color: AppColors.gry),
          ],
        ),
      ),
    );
  }
}

Widget attachmentTile(
  BuildContext context,
  String path,
  String label, {
  bool isVideo = false,
  VoidCallback? onTap,
}) {
  const double _tileW = 144.5;
  const double _tileH = 146;
  final themeProvider = context.watch<ThemeProvider>();
  final bannerImage = themeProvider.bannerImage;

  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: _tileW,
      height: _tileH,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.white11, width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            offset: Offset(1, 5),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thumbnail section
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child:
                  isVideo
                      //?
                      // Container(
                      //   color: Colors.black54, // 🎨 video background color
                      //   child: const Center(
                      //     child: Icon(
                      //       Icons.play_circle_fill,
                      //       size: 40,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // )
                      ? Stack(
                        fit: StackFit.expand,
                        children: [
                          // 🎞️ Video thumbnail (banner image fallback)
                          bannerImage != null && bannerImage.isNotEmpty
                              ? Image.network(
                                bannerImage,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(color: Colors.black54);
                                },
                              )
                              : Container(color: Colors.black54),

                          // ▶️ Play icon overlay
                          const Center(
                            child: Icon(
                              Icons.play_circle_fill,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                      : (path.isNotEmpty &&
                          (path.startsWith("http") || path.startsWith("https")))
                      ? Image.network(
                        path,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        cacheWidth: 300,
                        cacheHeight: 300,
                        filterQuality: FilterQuality.low,

                        // 🔄 Show loading indicator
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Container(
                            //color: const Color.fromARGB(255, 179, 205, 243),
                            child: const Center(
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.green,
                              ),
                            ),
                          );
                        },

                        // ❌ Error fallback
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: AppColors.grey300,
                            child: const Center(
                              child: Icon(
                                Icons.image,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      )
                      : Container(
                        color: AppColors.grey300,
                        child: const Center(
                          child: Icon(
                            Icons.image,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
            ),
          ),

          const SizedBox(height: 10),

          // Label row
          Row(
            children: [
              // File type icon
              Image.asset(
                isVideo ? 'assets/videoss.png' : 'assets/imagess.png',
                width: 16,
                height: 16,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  // Fallback icon if asset not found
                  return Icon(
                    isVideo ? Icons.videocam : Icons.image,
                    size: 16,
                    color: AppColors.grey545562,
                  );
                },
              ),
              const SizedBox(width: 6),

              // File name
              Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.0,
                    letterSpacing: -0.3,
                    color: AppColors.grey545562,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
