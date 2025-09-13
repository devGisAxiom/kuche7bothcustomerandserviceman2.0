// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: const SplashScreen(),
//     );
//   }
// }

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.white, // background color
//         alignment: Alignment.center,
//         child: Image.asset(
//           "assets/key.png", // centered image
//           width: 300,
//           height: 300,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/storage/usepreference.dart';
import 'package:flutter_application_1/customer/screen/homepage.dart';
import 'package:flutter_application_1/customer/screen/login.dart';
import 'package:flutter_application_1/serviceman/view/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateUser();
  }

  Future<void> _navigateUser() async {
    await Future.delayed(const Duration(seconds: 2)); // splash delay

    String? token = await UserPreferences.getToken();
    int? userType = await UserPreferences.getSelectedValue();

    if (token != null && token.isNotEmpty && userType != null) {
      if (userType == 1) {
        // Service Man
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomePage()),
        );
      } else if (userType == 2) {
        // Customer
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      } else {
        // fallback → Login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => LoginScreen()),
        );
      }
    } else {
      // Not logged in → Login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white, // background color
        alignment: Alignment.center,
        child: Image.asset(
          "assets/key.png", // splash logo
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}
