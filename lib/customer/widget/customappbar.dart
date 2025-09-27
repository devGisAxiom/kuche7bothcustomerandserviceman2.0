import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/sessionmanager.dart';
import 'package:flutter_application_1/customer/povider/customerprofileprovider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CommonAppBar extends StatefulWidget {
  final String title;
  final VoidCallback? onBack;
  final Color backgroundColor;
  final Color circlecolor;
  final Color arrowcolor;
  final Color? color1;
  final Color? color2;
  final bool canGoBack;

  const CommonAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.backgroundColor = const Color(0xFFEE262D),
    this.circlecolor = const Color(0xFFFF8F93),
    this.arrowcolor = const Color.fromARGB(255, 14, 14, 14),
    this.color1,
    this.color2,
    this.canGoBack = true,
  });

  @override
  CommonAppBarState createState() => CommonAppBarState(); // Public state
}

class CommonAppBarState extends State<CommonAppBar> {
  OverlayEntry? _overlayEntry;

  void _toggleTooltip(BuildContext context, GlobalKey key) {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      return;
    }

    final renderBox = key.currentContext!.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder:
          (context) => Positioned(
            top: offset.dy + renderBox.size.height + 8,
            right: 16,
            child: Material(
              color: Colors.transparent,
              child: const LogoutTooltip(),
            ),
          ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  /// Public method to hide the tooltip
  void hideTooltip() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = context.watch<ProfileProvider>();
    final theme = Theme.of(context);
    final userName = profileProvider.profile?.data?.name ?? "User";
    final Color finalColor1 = widget.color1 ?? theme.colorScheme.secondary;
    final Color finalColor2 = widget.color2 ?? theme.colorScheme.primary;

    final avatarKey = GlobalKey();

    return Container(
      color: widget.backgroundColor,
      child: SafeArea(
        bottom: false,
        top: true,
        minimum: const EdgeInsets.only(top: 55.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          child: Row(
            children: [
              // Back Button
              IconButton(
                onPressed:
                    widget.canGoBack
                        ? (widget.onBack ?? () => Navigator.pop(context))
                        : null,
                icon: Container(
                  width: 41,
                  height: 41,
                  padding: const EdgeInsets.all(4.67),
                  decoration: BoxDecoration(
                    color: widget.circlecolor,
                    borderRadius: BorderRadius.circular(93.33),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                    color: widget.arrowcolor,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              // Title
              Expanded(
                child: Text(
                  widget.title,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    height: 1.0,
                    letterSpacing: -0.3,
                    color: Colors.white,
                  ),
                ),
              ),
              // Profile avatar + arrow
              Row(
                key: avatarKey,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: finalColor1,
                    child: Text(
                      userName.isNotEmpty ? userName[0].toUpperCase() : "?",
                      style: TextStyle(
                        color: finalColor2,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  GestureDetector(
                    child: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    ),
                    onTap: () => _toggleTooltip(context, avatarKey),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LogoutTooltip extends StatelessWidget {
  const LogoutTooltip({super.key});

  @override
  Widget build(BuildContext context) {
    // Define the BoxShadow properties from Figma once for both the card and the arrow
    const List<BoxShadow> tooltipBoxShadows = [
      BoxShadow(
        // Color: #000000 @ 10% opacity
        color: Colors.black12,
        // Offset: X: 1, Y: 5
        offset: Offset(1, 5),
        // Blur: 8
        blurRadius: 8,
        // Spread: 0
        spreadRadius: 0,
      ),
    ];

    // The arrow is a 12x12 square rotated 45 degrees.
    const double arrowSize = 12;
    // The margin on the main card accounts for half the arrow's height (6px)
    const double arrowSpace = 6;

    // Figma background color is #FFFFFF
    const Color cardColor = Colors.white;

    return Stack(
      // Centers the children horizontally at the top of the stack area
      alignment: Alignment.topCenter,
      children: [
        // Arrow (Triangle)
        Positioned(
          // Positions the top edge of the 12x12 arrow at the very top of the Stack
          top: 0,
          // Horizontal position for the arrow (tweaked in original code)
          right: 28,
          child: Transform.rotate(
            // Rotate 45 degrees to form a diamond/triangle shape
            angle: 45 * pi / 180,
            child: Container(
              width: arrowSize,
              height: arrowSize,
              decoration: const BoxDecoration(
                color: cardColor,
                // Apply the shadow to the arrow (note: the shadow is applied to the
                // unrotated square, which is visually close to the design)
                boxShadow: tooltipBoxShadows,
              ),
            ),
          ),
        ),

        // Main card
        GestureDetector(
          onTap: () {
            SessionManager.logout(context);
          },
          child: Container(
            // Margin to push the card down, creating space for the arrow pointer
            margin: const EdgeInsets.only(top: arrowSpace),
            // Padding matches Figma: Top: 10, Right: 20, Bottom: 10, Left: 20
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: cardColor, // Matches Figma Colors: #FFFFFF
              // Matches Figma Radius: 6px
              borderRadius: BorderRadius.circular(6),
              // Matches Figma Shadows and blurs
              boxShadow: tooltipBoxShadows,
            ),
            child: Row(
              // Matches Figma Width: Hug (for content)
              mainAxisSize: MainAxisSize.min,
              // Matches Figma Flow: Horizontal (Implied by Row)
              children: [
                Text(
                  'Log out',
                  style: GoogleFonts.poppins(
                    // Corresponds to font-weight: 400 (Regular)
                    fontWeight: FontWeight.w400,
                    // Corresponds to font-size: 14px
                    fontSize: 14,
                    // Corresponds to line-height: 100%
                    height: 1.0,
                    // Corresponds to letter-spacing: -0.3px
                    letterSpacing: -0.3,
                    // Assuming 'Log out' text is black as per the initial implementation
                    color: Colors.black,
                  ),
                ),
                // Matches Figma Gap: 10px
                SizedBox(width: 10),
                // Icon is typically placed after text for a "Log out" button
                Icon(Icons.logout, color: Colors.black, size: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
