import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledImageCard extends StatelessWidget {
  final String imagePath; // asset or network
  final String imagePathlogo; // asset or network
  final double width;
  final double height;
  final String buttonText;
  final VoidCallback onPressed;
  final Color buttonColor;
  final Color labelColor;
  final Color texcolor;

  const StyledImageCard({
    super.key,
    required this.imagePath,
    required this.imagePathlogo,
    this.width = 335,
    this.height = 242,
    this.buttonText = 'Explore',
    this.buttonColor = AppColors.redEE,
    this.labelColor = AppColors.lightshadered,
    this.texcolor = AppColors.textcolor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior:
          Clip.antiAlias, // Ensures the Stack respects the borderRadius
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        boxShadow: const [
          BoxShadow(
            color: AppColors.black1A,
            offset: Offset(1, 5),
            blurRadius: 8,
          ),
        ],
        image: DecorationImage(
          image:
              imagePath.startsWith('http')
                  ? NetworkImage(imagePath)
                  : AssetImage("assets/kuche.png") as ImageProvider,
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            width: 105,
            height: 54.35,
            padding: const EdgeInsets.all(7.98),
            decoration: BoxDecoration(
              color: labelColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(6), // Fixed: match card
                bottomRight: Radius.circular(2.4),
              ),
            ),
            child:
            // SizedBox(
            //   width: 89.03,
            //   height: 38.38,
            //   child: Image.network(imagePathlogo, fit: BoxFit.contain),
            // ),
            SizedBox(
              width: 89.03,
              height: 38.38,
              child:
                  (imagePathlogo.startsWith("http") ||
                          imagePathlogo.startsWith("https"))
                      ? Image.network(
                        imagePathlogo,
                        fit: BoxFit.contain,
                        errorBuilder:
                            (context, error, stackTrace) => Image.asset(
                              "assets/kuche.png",
                              fit: BoxFit.contain,
                            ),
                      )
                      : Image.asset('assets/kuche.png', fit: BoxFit.contain),
            ),
          ),
          Positioned(
            bottom: 40,
            right: 23,
            child: Material(
              color: AppColors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(6),
                onTap: onPressed,
                child: IntrinsicWidth(
                  child: Container(
                    height: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: FittedBox(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            buttonText,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              height: 1.0,
                              letterSpacing: -0.3,
                              color: texcolor,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 13,
                            color: texcolor,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
