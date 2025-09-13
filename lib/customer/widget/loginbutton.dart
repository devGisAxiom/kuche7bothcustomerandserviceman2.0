import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  /// Optional background color (defaults to Kuche7 red).
  final Color backgroundColor;

  /// Optional text color (defaults to white).
  final Color textColor;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = AppColors.redEE,
    this.textColor = AppColors.white,
  });

  static const _shadow = AppColors.black1A;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: onPressed,
        child: Container(
          width: 335,
          height: 42,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(6),
            boxShadow: const [
              BoxShadow(
                color: _shadow, // 10 % black
                offset: Offset(1, 5),
                blurRadius: 8,
              ),
            ],
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.5,
              letterSpacing: -0.011,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
