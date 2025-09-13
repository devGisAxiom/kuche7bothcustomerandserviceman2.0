// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/customer/povider/themeprovider.dart';
// // import 'package:flutter_application_1/customer/screen/brandhome.dart';
// import 'package:flutter_application_1/customer/utils/appcolor.dart';
// import 'package:flutter_application_1/customer/widget/customappbar.dart';
// import 'package:flutter_application_1/customer/widget/styledimagecard.dart';
// import 'package:flutter_application_1/customer/screen/bottumnav.dart';
// import 'package:provider/provider.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.redEE, //const Color(0xFFEE262D),
//       body: Column(
//         children: [
//           const CommonAppBar(
//             title: 'Select the Brand',
//             backgroundColor: AppColors.redEE, //const Color(0xFFEE262D),
//           ),
//           Expanded(
//             child: Center(
//               child: Container(
//                 width: 375,
//                 height: 688,
//                 padding: const EdgeInsets.symmetric(vertical: 30),
//                 decoration: const BoxDecoration(
//                   color: AppColors.white, //Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(37),
//                     topRight: Radius.circular(37),
//                   ),
//                 ),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       // Banner Image
//                       // Image.asset('assets/kuche_banner.jpg', fit: BoxFit.cover),
//                       // const SizedBox(height: 20),
//                       StyledImageCard(
//                         imagePath: 'assets/kucheproduct.jpg',
//                         buttonText: 'Explore',
//                         onPressed: () {
//                           Provider.of<ThemeProvider>(
//                             context,
//                             listen: false,
//                           ).setTheme(
//                             mainColor: const Color(0xFFEE262D),
//                             subColor: const Color(0xFFFFE9EA),
//                             textColor: const Color(0xFFFFFFFF),
//                           );
//                           // Do something on button click
//                           Navigator.of(context).push(
//                             MaterialPageRoute(builder: (context) => MainPage()),
//                           );
//                         },
//                         imagePathlogo: 'assets/kuche.png',
//                       ),
//                       SizedBox(height: 20),
//                       StyledImageCard(
//                         imagePath: 'assets/nolteframe.jpg',
//                         buttonText: 'Explore',
//                         buttonColor: Color(0xFFFFF100),
//                         labelColor: Color(0xFFFFFCD6),

//                         onPressed: () {
//                           // Do something on button click
//                           Provider.of<ThemeProvider>(
//                             context,
//                             listen: false,
//                           ).setTheme(
//                             mainColor: const Color(0xFFD1C71A),
//                             subColor: const Color(0xFFFFFCD6),
//                             textColor: Colors.black,
//                           );
//                           Navigator.of(context).push(
//                             MaterialPageRoute(builder: (context) => MainPage()),
//                           );
//                         },
//                         texcolor: Colors.black,
//                         imagePathlogo: 'assets/nolte.png',
//                       ),
//                       SizedBox(height: 20),
//                       StyledImageCard(
//                         imagePath: 'assets/venturaframe.jpg',
//                         buttonText: 'Explore',
//                         buttonColor: Color(0xFF8C6F41),
//                         labelColor: Color(0xFFB1905B),
//                         onPressed: () {
//                           Provider.of<ThemeProvider>(
//                             context,
//                             listen: false,
//                           ).setTheme(
//                             mainColor: const Color(0xFFB1905B),
//                             subColor: const Color(0xFFEAEAEA),
//                             textColor: const Color(0xFFFFFFFF), //0xFFFFFFFF
//                           );
//                           // Do something on button click
//                           Navigator.of(context).push(
//                             MaterialPageRoute(builder: (context) => MainPage()),
//                           );
//                         },
//                         imagePathlogo: 'assets/venture.png',
//                       ),
//                       SizedBox(height: 20),
//                       StyledImageCard(
//                         imagePath: 'assets/oppeinframe.jpg',
//                         buttonText: 'Explore',
//                         buttonColor: Color(0xFF454545),
//                         labelColor: Color(0xFFEAEAEA),
//                         onPressed: () {
//                           // Do something on button click
//                           Provider.of<ThemeProvider>(
//                             context,
//                             listen: false,
//                           ).setTheme(
//                             mainColor: const Color(0xFF454545), // 0xFFEAEAEA
//                             subColor: const Color(0xFFEAEAEA),
//                             textColor: const Color(0xFFFFFFFF),
//                           );

//                           Navigator.of(context).push(
//                             MaterialPageRoute(builder: (context) => MainPage()),
//                           );
//                         },
//                         imagePathlogo: 'assets/oppein.png',
//                       ),
//                       // Buttons
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import 'package:flutter_application_1/customer/povider/brandprovider.dart';
import 'package:flutter_application_1/customer/povider/themeprovider.dart';
import 'package:flutter_application_1/customer/screen/bottumnav.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';
import 'package:flutter_application_1/customer/widget/customappbar.dart';
import 'package:flutter_application_1/customer/widget/styledimagecard.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // String token =
  //     "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL3Btcy5naXNheGlvbS5jb20vYXBpL2xvZ2luIiwiaWF0IjoxNzU2OTY1ODk0LCJleHAiOjE3NTY5Njk0OTQsIm5iZiI6MTc1Njk2NTg5NCwianRpIjoibEk5Q0N3SFc1Q0VJT096eSIsInN1YiI6IjMiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.5sZBDEO-68XqYvpCmiuyfzCU0stpenqzar0geCpANaw"; // replace with your actual token or fetch from storage

  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => Provider.of<BrandProvider>(context, listen: false).getBrands(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.redEE,
      body: Column(
        children: [
          const CommonAppBar(
            title: 'Select the Brand',
            backgroundColor: AppColors.redEE,
          ),
          Expanded(
            child: Center(
              child: Container(
                width: 375,
                height: 688,
                padding: const EdgeInsets.symmetric(vertical: 30),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(37),
                    topRight: Radius.circular(37),
                  ),
                ),
                child: Consumer<BrandProvider>(
                  builder: (context, provider, _) {
                    if (provider.loading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final brands = provider.brands?.data ?? [];
                    if (brands.isEmpty) {
                      return const Center(child: Text("No brands available"));
                    }

                    return SingleChildScrollView(
                      child: AnimationLimiter(
                        child: Column(
                          children: AnimationConfiguration.toStaggeredList(
                            duration: const Duration(milliseconds: 600),
                            delay: const Duration(milliseconds: 100),
                            childAnimationBuilder:
                                (widget) => SlideAnimation(
                                  // duration: const Duration(milliseconds: 600),
                                  horizontalOffset: -200, // slide in from left
                                  curve:
                                      Curves
                                          .fastEaseInToSlowEaseOut, // bounce effect
                                  child: FadeInAnimation(child: widget),
                                ),
                            children:
                                brands.map((brand) {
                                  return Column(
                                    children: [
                                      StyledImageCard(
                                        // ✅ if banner is empty/null → fallback
                                        imagePath:
                                            (brand.banner != null &&
                                                    brand.banner!.isNotEmpty)
                                                ? brand.banner!
                                                : "assets/kuche.png",
                                        buttonText: "Explore",
                                        buttonColor: Color(
                                          int.parse(
                                            "0xFF${brand.colourTheme?.replaceAll('#', '') ?? 'EE262D'}",
                                          ),
                                        ),
                                        labelColor: Color(
                                          int.parse(
                                            "0xFF${brand.colorTab?.replaceAll('#', '') ?? 'FFE9EA'}",
                                          ),
                                        ),
                                        texcolor:
                                            brand.colorIcon != null
                                                ? _parseColor(brand.colorIcon)
                                                : Colors.black,
                                        onPressed: () {
                                          Provider.of<ThemeProvider>(
                                            context,
                                            listen: false,
                                          ).setTheme(
                                            mainColor: Color(
                                              int.parse(
                                                "0xFF${brand.colourTheme?.replaceAll('#', '') ?? 'EE262D'}",
                                              ),
                                            ),
                                            subColor: Color(
                                              int.parse(
                                                "0xFF${brand.colorTab?.replaceAll('#', '') ?? 'FFE9EA'}",
                                              ),
                                            ),
                                            bannerImage: brand.banner,
                                            textColor: _parseColor(
                                              brand.colorIcon,
                                            ),
                                            bannerImage2: brand.image,
                                            logo: brand.logo,
                                            brandName: brand.name,
                                            idProduct: brand.idProduct,
                                          );

                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => MainPage(),
                                            ),
                                          );
                                        },
                                        // ✅ if logo missing → fallback logo
                                        imagePathlogo:
                                            (brand.logo != null &&
                                                    brand.logo!.isNotEmpty)
                                                ? brand.logo!
                                                : "assets/kuche.png",
                                      ),
                                      const SizedBox(height: 20),
                                    ],
                                  );
                                }).toList(),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// helper function to parse hex color like "#EE262D" or "EE262D"
  Color _parseColor(String? hexColor) {
    if (hexColor == null || hexColor.isEmpty) return Colors.black;
    String hex = hexColor.replaceAll("#", "");
    if (hex.length == 6) hex = "FF$hex"; // add opacity if missing
    return Color(int.parse("0x$hex"));
  }
}

/// Convert HEX string from API (like "#EE262D") into Color
// static Color? _hexToColor(String? hex) {
//   if (hex == null || hex.isEmpty) return null;
//   String formatted = hex.replaceAll("#", "");
//   if (formatted.length == 6) {
//     formatted = "FF$formatted"; // add alpha if missing
//   }
//   return Color(int.parse(formatted, radix: 16));
// }

/// -------------------- MAIN --------------------
// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => ThemeProvider()),
        
//       ],
//       child: const MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final themeProvider = Provider.of<ThemeProvider>(context);

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Brand Selector',
//       theme: themeProvider.theme,
//       home: const HomeScreen(),
//     );
//   }
// }
// //Color(0xFFEAEAEA),