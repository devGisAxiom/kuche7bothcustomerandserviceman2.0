import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class NavItem extends StatelessWidget {
  final String label;
  final String svgPath;
  final bool isActive;
  final VoidCallback onTap;

  const NavItem({
    required this.label,
    required this.svgPath,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            svgPath,
            height: 24,
            colorFilter: ColorFilter.mode(
              isActive ? theme.colorScheme.primary : AppColors.gryshade,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color:
                  isActive ? theme.colorScheme.primary : AppColors.grey545562,
            ),
          ),
        ],
      ),
    );
  }
}
