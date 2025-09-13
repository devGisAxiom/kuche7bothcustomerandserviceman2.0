import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';
import 'package:flutter_svg/svg.dart';

Widget iconBadge(String asset) => Container(
  width: 22,
  height: 22,
  decoration: BoxDecoration(
    color: AppColors.redopacity10, // red @ ~10% opacity
    borderRadius: BorderRadius.circular(146.67),
  ),
  child: Padding(
    padding: const EdgeInsets.only(top: 1.25), // ⬅️ top offset
    child: Center(
      child: SvgPicture.asset(
        asset,
        width: 10, // ⬅️ fixed width
        height: 10, // ⬅️ fixed height
        // Uncomment below to color the icon if needed:
        // colorFilter: const ColorFilter.mode(
        //   Color(0xFFEE262D),
        //   BlendMode.srcIn,
        // ),
      ),
    ),
  ),
);
