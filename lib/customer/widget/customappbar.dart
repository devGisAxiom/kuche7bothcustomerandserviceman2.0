// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/customer/utils/appcolor.dart';
// import 'package:google_fonts/google_fonts.dart';

// class CommonAppBar extends StatelessWidget {
//   final String title;
//   final VoidCallback? onBack;
//   final Color backgroundColor;

//   const CommonAppBar({
//     super.key,
//     required this.title,
//     this.onBack,
//     this.backgroundColor = AppColors.redEE, // red background
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: backgroundColor,

//       child: SafeArea(
//         bottom: false,
//         top: true,
//         minimum: const EdgeInsets.only(top: 50.0),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
//           child: Row(
//             children: [
//               // Back Button
//               IconButton(
//                 onPressed: onBack ?? () => Navigator.pop(context),
//                 icon: Container(
//                   width: 41,
//                   height: 41,
//                   padding: const EdgeInsets.all(4.67),
//                   decoration: BoxDecoration(
//                     color: AppColors.lightredd,
//                     borderRadius: BorderRadius.circular(93.33),
//                   ),
//                   child: const Icon(
//                     Icons.arrow_back_ios_new,
//                     size: 20,
//                     color: AppColors.white,
//                   ),
//                 ),
//               ),

//               const SizedBox(width: 5),

//               // Title - Expand to take available space
//               Expanded(
//                 child: Text(
//                   title,
//                   style: GoogleFonts.poppins(
//                     fontWeight: FontWeight.w500,
//                     fontSize: 18,
//                     height: 1.0,
//                     letterSpacing: -0.3,
//                     color: AppColors.white,
//                   ),
//                 ),
//               ),

//               // Profile image + dropdown
//               Row(
//                 children: [
//                   Container(
//                     width: 40,
//                     height: 40,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(color: AppColors.white, width: 1),
//                       image: const DecorationImage(
//                         fit: BoxFit.cover,
//                         image: AssetImage('assets/img1.png'), // update path
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 6),
//                   const Icon(Icons.keyboard_arrow_down, color: AppColors.white),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;
  final Color backgroundColor;
  final Color circlecolor;
  final Color arrowcolor;

  const CommonAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.backgroundColor = const Color(0xFFEE262D), // red background
    this.circlecolor = const Color(0xFFFF8F93),
    this.arrowcolor = const Color.fromARGB(255, 14, 14, 14),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
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
                onPressed: onBack ?? () => Navigator.pop(context),
                icon: Container(
                  width: 41,
                  height: 41,
                  padding: const EdgeInsets.all(4.67),
                  decoration: BoxDecoration(
                    color: circlecolor,
                    borderRadius: BorderRadius.circular(93.33),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    size: 20,
                    color: arrowcolor,
                  ),
                ),
              ),

              const SizedBox(width: 5),

              // Title - Expand to take available space
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    height: 1.0,
                    letterSpacing: -0.3,
                    color: Colors.white,
                  ),
                ),
              ),

              // Profile image + dropdown
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/img1.png'), // update path
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
