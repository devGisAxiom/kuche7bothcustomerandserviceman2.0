import 'package:flutter/material.dart';

class ServicemanCard extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  final VoidCallback onTap;

  // Colors
  final Color gradientStartColor;
  final Color gradientEndColor;
  final Color shadowColor;
  final Color iconColor;
  final Color titleColor;
  final Color subtitleColor;

  const ServicemanCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
    this.gradientStartColor = Colors.green,
    this.gradientEndColor = Colors.lightGreen,
    this.shadowColor = Colors.black,
    this.iconColor = Colors.white,
    this.titleColor = Colors.white,
    this.subtitleColor = Colors.white70,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Scaling factors for responsiveness
    double widthFactor = screenWidth / 375;
    double heightFactor = screenHeight / 812;

    if (screenWidth > 600) {
      // For tablets or larger screens
      widthFactor = screenWidth / 768;
      heightFactor = screenHeight / 1280;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth * 0.8,
        height: MediaQuery.of(context).size.height * 0.3,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientStartColor, gradientEndColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius:
              BorderRadius.circular(10 * widthFactor), // Adjusted border radius
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.2),
              blurRadius: 6 * widthFactor,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(16 * widthFactor),
              child: Icon(
                icon,
                color: iconColor,
                size: 90 * widthFactor, // Scalable icon size
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: titleColor,
                      fontSize: 20 * widthFactor, // Scalable title size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5 * heightFactor),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: subtitleColor,
                      fontSize: 14 * widthFactor, // Scalable subtitle size
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
