import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Styles {
  static Color accentColor = const Color.fromRGBO(146, 227, 169, 1);
  static Color greyedOutColor = const Color.fromRGBO(206, 206, 206, 1);
  static Color greyedOutTextColor = const Color.fromRGBO(127, 127, 127, 1);

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

  static TextStyle labelText = const TextStyle(
    fontSize: 14,
    color: Colors.black
  );

  static TextStyle challengeTitle = const TextStyle(
      fontSize: 16,
      color: Colors.black
  );

  static TextStyle challengeInvitedBy = const TextStyle(
      fontSize: 14,
      color: Colors.black,
      fontWeight: FontWeight.bold
  );

  static TextStyle challengeTimeBlack = const TextStyle(
      fontSize: 12,
      color: Colors.black,
  );

  static TextStyle challengeTimePink = const TextStyle(
      fontSize: 14,
      color: Color.fromRGBO(255, 23, 68, 0.68),
  );

  static TextStyle evaluationText = TextStyle(
    fontSize: 10,
    color: greyedOutTextColor,
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
