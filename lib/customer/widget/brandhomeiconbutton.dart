import 'package:flutter/material.dart';
import 'package:flutter_application_1/customer/povider/themeprovider.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ServiceTile extends StatelessWidget {
  final String iconAsset; // <-- SVG path
  final String label;
  final VoidCallback onTap;

  const ServiceTile({
    super.key,
    required this.iconAsset,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Material(
      color: Colors.transparent, // keeps ripple visible
      child: InkWell(
        borderRadius: BorderRadius.circular(6),
        onTap: onTap,
        child: Container(
          width: 162.5,
          height: 118,
          padding: const EdgeInsets.all(20), // 20 px padding
          decoration: BoxDecoration(
            //color: scheme.secondary
            color:
                themeProvider.brandName == "Ventura"
                    ? const Color(0xFFEAEAEA) // special case
                    : scheme.secondary,

            // #EE262D1A (10 % opacity)
            borderRadius: BorderRadius.circular(6), // 6 px radius
            border: Border.all(
              color: AppColors.bordercolor, // #EFDFDF border
              width: 1,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ─── icon in red circle ─────────────────────────────
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: scheme.primary, //AppColors.redEE, // solid red circle
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    iconAsset,
                    width: 23,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                      scheme.onPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),

              Text(
                label,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.darkgrycolor, // dark gray for text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
