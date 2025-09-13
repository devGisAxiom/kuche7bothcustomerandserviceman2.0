import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = ThemeData.light();
  String? _bannerImage; // ✅ primary banner
  String? _bannerImage2; // ✅ secondary banner
  String? _logo; // ✅ brand logo
  String? _brandName; // ✅ brand name
  int? _idProduct;

  ThemeData get theme => _themeData;
  String? get bannerImage => _bannerImage;
  String? get bannerImage2 => _bannerImage2;
  String? get logo => _logo;
  String? get brandName => _brandName;
  int? get idProduct => _idProduct;

  void setTheme({
    required Color mainColor,
    required Color subColor,
    required Color textColor,
    String? bannerImage, // ✅ optional
    String? bannerImage2, // ✅ optional
    String? logo, // ✅ optional
    String? brandName, // ✅ optional
    int? idProduct,
  }) {
    final brightness = ThemeData.estimateBrightnessForColor(mainColor);

    _themeData = ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: mainColor,
        onPrimary: textColor,
        secondary: subColor,
        onSecondary: textColor,
        background: Colors.white,
        onBackground: textColor,
        surface: Colors.white,
        onSurface: textColor,
        error: Colors.red,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: AppBarTheme(
        backgroundColor: mainColor,
        foregroundColor: textColor,
      ),
      textTheme: ThemeData.light().textTheme.apply(
        bodyColor: textColor,
        displayColor: textColor,
      ),
    );

    // ✅ assign optional branding properties
    _bannerImage = bannerImage;
    _bannerImage2 = bannerImage2;
    _logo = logo;
    _brandName = brandName;
    _idProduct = idProduct;

    notifyListeners();
  }
}
