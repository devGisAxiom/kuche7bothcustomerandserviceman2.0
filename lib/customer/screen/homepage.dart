import 'package:flutter/material.dart';
import 'package:flutter_application_1/customer/povider/brandprovider.dart';
import 'package:flutter_application_1/customer/povider/customerprofileprovider.dart';
import 'package:flutter_application_1/customer/povider/themeprovider.dart';
import 'package:flutter_application_1/customer/screen/bottumnav.dart';
import 'package:flutter_application_1/core/utils/appcolor.dart';
import 'package:flutter_application_1/customer/widget/customappbar.dart';
import 'package:flutter_application_1/customer/widget/styledimagecard.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<CommonAppBarState> _commonAppBarKey = GlobalKey();
  late VoidCallback _scrollListener;

  @override
  void initState() {
    super.initState();

    // Hide tooltip on scroll
    _scrollListener = () => _commonAppBarKey.currentState?.hideTooltip();
    _scrollController.addListener(_scrollListener);

    // Load brands
    Future.microtask(
      () =>
          Provider.of<BrandProvider>(context, listen: false).getBrands(context),
    );

    // Load profile if not loaded
    Future.microtask(() {
      final provider = context.read<ProfileProvider>();
      if (provider.profile == null && !provider.isLoading) {
        provider.loadProfile(context);
      }
    });
  }

  @override
  void dispose() {
    // Hide tooltip when leaving the page
    _commonAppBarKey.currentState?.hideTooltip();

    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  // Helper method to parse hex colors
  Color _parseColor(String? hexColor) {
    if (hexColor == null || hexColor.isEmpty) return Colors.black;
    String hex = hexColor.replaceAll("#", "");
    if (hex.length == 6) hex = "FF$hex";
    return Color(int.parse("0x$hex"));
  }

  // Helper method to navigate and hide tooltip
  void _navigateAndHideTooltip(Widget page) {
    _commonAppBarKey.currentState?.hideTooltip();
    Navigator.of(context).push(MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    const double appBarHeight = 56.0;

    return Scaffold(
      backgroundColor: AppColors.redEE,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // AppBar
            CommonAppBar(
              key: _commonAppBarKey,
              title: 'Select the Brand',
              backgroundColor: AppColors.redEE,
              canGoBack: false,
              color1: Colors.white,
              color2: const Color(0xFFEE262D),
            ),

            LayoutBuilder(
              builder: (context, constraints) {
                final double screenHeight = MediaQuery.of(context).size.height;
                final double remainingHeight = screenHeight - appBarHeight;

                return Container(
                  width: double.infinity,
                  constraints: BoxConstraints(minHeight: remainingHeight),
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
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 50),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      final brands = provider.brands?.data ?? [];
                      if (brands.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 50),
                          child: Center(child: Text("No brands available")),
                        );
                      }

                      return AnimationLimiter(
                        child: Column(
                          children: AnimationConfiguration.toStaggeredList(
                            duration: const Duration(milliseconds: 600),
                            delay: const Duration(milliseconds: 100),
                            childAnimationBuilder:
                                (widget) => SlideAnimation(
                                  horizontalOffset: -200,
                                  curve: Curves.fastEaseInToSlowEaseOut,
                                  child: FadeInAnimation(child: widget),
                                ),
                            children:
                                brands.asMap().entries.map((entry) {
                                  int index = entry.key;
                                  final brand = entry.value;

                                  return Column(
                                    children: [
                                      if (index == 0)
                                        const SizedBox(height: 15),
                                      StyledImageCard(
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

                                          // Navigate to next page safely
                                          _navigateAndHideTooltip(MainPage());
                                        },
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
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
