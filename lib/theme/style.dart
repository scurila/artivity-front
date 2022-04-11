import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Styles {
  static Color accentColor = const Color.fromRGBO(146, 227, 169, 1);

  static String loginBackgroundPath = 'assets/images/bg.png';
  static String loginLogoPath = 'assets/images/Worldline_logo_blue_bg.png';

  static TextStyle pageTitleText = const TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  static TextStyle accentButtonText = const TextStyle(
    fontSize: 14,
    color: Colors.white
  );

  static ThemeData get baseTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
    );
  }

  static BoxBorder get noBorder {
    return Border.all(color: Colors.white, width: 0.0);
  }
}
