// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/customer/screen/brandhome.dart';
// import 'package:flutter_application_1/customer/screen/profilepage.dart';
// import 'package:flutter_application_1/customer/screen/servicehome.dart';
// import 'package:flutter_application_1/customer/widget/bottumnav.dart';

// class _MainPageState extends State<MainPage> {
//   int _currentIndex = 0;

//   List<Widget> _pages() => [
//         BrandHome(onTabChange: (index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         }),
//         const Service(),
//         const Profile(),
//       ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages()[_currentIndex],
//       bottomNavigationBar: Container(
//         height: 80,
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               offset: Offset(0, -4),
//               blurRadius: 10,
//               color: Color(0x1A000000),
//             ),
//           ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             NavItem(
//               label: 'Home',
//               svgPath: 'assets/icon/home.svg',
//               isActive: _currentIndex == 0,
//               onTap: () => setState(() => _currentIndex = 0),
//             ),
//             NavItem(
//               label: 'Service Request',
//               svgPath: 'assets/icon/servicereq.svg',
//               isActive: _currentIndex == 1,
//               onTap: () => setState(() => _currentIndex = 1),
//             ),
//             NavItem(
//               label: 'Profile',
//               svgPath: 'assets/icon/profile.svg',
//               isActive: _currentIndex == 2,
//               onTap: () => setState(() => _currentIndex = 2),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_1/customer/screen/brandhome.dart';
import 'package:flutter_application_1/customer/screen/profilepage.dart';
import 'package:flutter_application_1/customer/screen/servicehome.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';
import 'package:flutter_application_1/customer/widget/bottumnav.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  // List<Widget> _pages() => [
  //   BrandHome(
  //     onTabChange: (index) {
  //       setState(() {
  //         _currentIndex = index;
  //       });
  //     },
  //   ),
  //   const Service(),
  //   const Profile(),
  // ];
  List<Widget> _pages() => [
    BrandHome(
      onTabChange: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    ),
    Service(
      onTabChange: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    ),
    Profile(
      onTabChange: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages()[_currentIndex],
      bottomNavigationBar: Container(
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: const BoxDecoration(
          color: AppColors.white, //Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, -4),
              blurRadius: 10,
              color: AppColors.black1A, //Color(0x1A000000),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NavItem(
              label: 'Home',
              svgPath: 'assets/icon/home.svg',
              isActive: _currentIndex == 0,
              onTap: () => setState(() => _currentIndex = 0),
            ),
            NavItem(
              label: 'Service Request',
              svgPath: 'assets/icon/servicereq.svg',
              isActive: _currentIndex == 1,
              onTap: () => setState(() => _currentIndex = 1),
            ),
            NavItem(
              label: 'Profile',
              svgPath: 'assets/icon/profile.svg',
              isActive: _currentIndex == 2,
              onTap: () => setState(() => _currentIndex = 2),
            ),
          ],
        ),
      ),
    );
  }
}
