import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewReviewDetail extends StatelessWidget {
  const ViewReviewDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.transparent,
      insetPadding: const EdgeInsets.fromLTRB(20, 45, 20, 20),
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
            child: Column(
              mainAxisSize: MainAxisSize.min, // Adjust height to content
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "Stataus :",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.0, // 100% line-height
                        letterSpacing: -0.3,
                        color: const Color(
                          0xFF545562,
                        ), // background color in CSS is usually used for containers, but used here as text color
                      ),
                    ),

                    const SizedBox(width: 4),
                    Text(
                      "Approved!",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.0, // 100% line-height
                        letterSpacing: 0, // 0% letter-spacing
                        color: Color(
                          0xFF00BC3F,
                        ), // text color (matches your background in CSS)
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      "ID :",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.0, // 100% line-height
                        letterSpacing: -0.3,
                        color:
                            AppColors
                                .grey545562, // background color in CSS is usually used for containers, but used here as text color
                      ),
                    ),

                    const SizedBox(width: 4),
                    Text(
                      "K7-1023",
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
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Product Name :',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.0, // 100% line height
                        letterSpacing: -0.3, // -0.3px
                        color: Color(
                          0xFF545562,
                        ), // text color must contrast with dark background
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Kuche7 Cupboard',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.0, // 100% line height
                        letterSpacing: 0.0, // 0%
                        color: Color(0xFF000000), // red text
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),

                Row(
                  children: [
                    Text(
                      "Review",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        height: 1.0,
                        letterSpacing: -0.3,
                        color: AppColors.grey545562,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(
                      Icons.star_rounded,
                      size: 20,
                      color: AppColors.amber,
                    ),
                    const Icon(
                      Icons.star_rounded,
                      size: 20,
                      color: AppColors.amber,
                    ),
                    const Icon(
                      Icons.star_rounded,
                      size: 20,
                      color: AppColors.amber,
                    ),
                    const Icon(
                      Icons.star_rounded,
                      size: 20,
                      color: AppColors.amber,
                    ),
                    Icon(
                      Icons.star_rounded,
                      size: 20,
                      color: AppColors.greyShade300,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.greyShade300),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    "Good!",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.0,
                      letterSpacing: 0,
                      color: AppColors.gry,
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // const SizedBox(height: 16),
              ],
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
