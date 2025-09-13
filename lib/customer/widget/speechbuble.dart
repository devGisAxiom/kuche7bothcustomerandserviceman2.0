import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';
import 'package:google_fonts/google_fonts.dart';

class SpeechBubble extends StatefulWidget {
  const SpeechBubble({
    super.key,
    required this.message,
    this.background = AppColors.redEE,
    this.textColor = AppColors.white,
  });

  final String message;
  final Color background;
  final Color textColor;

  @override
  State<SpeechBubble> createState() => _SpeechBubbleState();
}

class _SpeechBubbleState extends State<SpeechBubble> {
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    // Hide the bubble after 3 seconds
    Future.delayed(const Duration(seconds: 2), () {
      // Changed from 5 to 3 seconds here
      if (mounted) {
        setState(() {
          _isVisible = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _isVisible,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
            decoration: BoxDecoration(
              color: widget.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              widget.message,
              style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.3,
                color: widget.textColor,
              ),
            ),
          ),
          Positioned(
            bottom: -6,
            left: 20,
            child: CustomPaint(
              size: const Size(12, 6),
              painter: _TrianglePainter(widget.background),
            ),
          ),
        ],
      ),
    );
  }
}

// Paints an isosceles triangle pointing UPWARDS
// Paints an isosceles triangle pointing DOWNWARDS (for a bubble *below* something)
class _TrianglePainter extends CustomPainter {
  _TrianglePainter(this.color);
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path =
        Path()
          ..moveTo(0, 0) // Start at top-left of triangle
          ..lineTo(
            size.width / 2,
            size.height,
          ) // Go to bottom-middle of triangle
          ..lineTo(size.width, 0) // Go to top-right of triangle
          ..close(); // Close the path to form a triangle

    final paint = Paint()..color = color;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
