import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';
import 'package:flutter_svg/svg.dart';

Widget buildOption(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6),
    child: Row(
      children: [
        //Icon(icon, color: Colors.grey[700]),
        SvgPicture.asset('assets/icon/policy.svg'),
        const SizedBox(width: 12),
        Expanded(
          child: Text(title, style: TextStyle(color: AppColors.black000)),
        ),
        const Icon(Icons.arrow_forward_ios, size: 16, color: AppColors.grey300),
      ],
    ),
  );
}
