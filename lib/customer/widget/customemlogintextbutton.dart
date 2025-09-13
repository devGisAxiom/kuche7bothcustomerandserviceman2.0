import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String? hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.label,
    this.hintText,
    this.obscureText = false,
    this.controller,
    this.keyboardType,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  static const _borderColor = AppColors.colorswith; // #D4D5DF
  static const _labelColor =
      AppColors.grey545562; // #545562 //Color(0xFF545562)

  @override
  void initState() {
    super.initState();
    // _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          widget.label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 1.0, // line-height 100%
            letterSpacing: -0.3, // exact match
            color: _labelColor, // for contrast
          ),
        ),
        const SizedBox(height: 11),

        // Text field
        TextField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText, // keep obscuring, just no toggle
          textAlignVertical: TextAlignVertical.center,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              fontSize: 12,
              color: Color.fromARGB(255, 201, 194, 194),
            ),
            filled: true,
            fillColor: AppColors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),

            // Border styles
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: _borderColor, width: 1.3),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: _borderColor, width: 1.3),
            ),

            // Eye / visibility toggle
          ),
        ),
      ],
    );
  }
}
