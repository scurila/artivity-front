import 'package:artivity_front/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Styles {
  static Color accentColor = const Color.fromRGBO(146, 227, 169, 1);
  static Color accentColorLight = const Color.fromRGBO(146, 227, 169, 0.3);
  static Color greyedOutColor = const Color.fromRGBO(206, 206, 206, 1);
  static Color greyedColor = const Color.fromRGBO(219, 219, 219, 1);
  static Color greyedOutTextColor = const Color.fromRGBO(127, 127, 127, 1);
  static Color greyedNavbarButton = const Color.fromRGBO(169, 169, 169, 1);

  static String loginBackgroundPath = 'assets/images/bg.png';
  static String loginLogoPath = 'assets/images/Worldline_logo_blue_bg.png';

  static const TextStyle pageTitleText = TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeight.w500,
  );

  static TextStyle sloganText = const TextStyle(
    fontSize: 30,
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

  static TextStyle challengeTitleBig = const TextStyle(
      fontSize: 20,
      color: Colors.black,
    fontWeight: FontWeight.bold
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

  static TextStyle TimerText = TextStyle(
    fontSize: 18,
    color: greyedOutTextColor
  );

  static TextStyle accentButtonTextDark = const TextStyle(
      fontSize: 14,
      color: Colors.black
  );

  static TextStyle dailyChallengeTitleText = const TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.bold
  );

  static TextStyle pasInscritText = const TextStyle(
      fontSize: 11,
      decoration: TextDecoration.underline,
      color: Colors.black
  );

  static ThemeData get baseTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
          }
      ),
    );
  }

  static TextStyle challengeDescription = const TextStyle(
      fontSize: 16,
      color: Colors.black
  );

  static TextStyle notificationDescription = const TextStyle(
      fontSize: 12,
      color: Colors.black
  );

  static BoxBorder get noBorder {
    return Border.all(color: Colors.white, width: 0.0);
  }

  static String getChallengeTypePicture(String challengeType) {
    if (challengeType == CHALLENGE_TYPE_DESSIN) {
      return "assets/images/defi_dessin.svg";
    } else if (challengeType == CHALLENGE_TYPE_AUDIO) {
      return "assets/images/defi_audio.svg";
    } else if (challengeType == CHALLENGE_TYPE_ECRITURE) {
      return "assets/images/defi_ecriture.svg";
    } else {
      // photo
      return "assets/images/defi_photo.svg";
    }
  }

  static String getDailyChallengeTypePicture(String challengeType) {
    if (challengeType == CHALLENGE_TYPE_DESSIN) {
      return "assets/images/daily_dessin.svg";
    } else if (challengeType == CHALLENGE_TYPE_AUDIO) {
      return "assets/images/daily_audio.svg";
    } else if (challengeType == CHALLENGE_TYPE_ECRITURE) {
      return "assets/images/daily_ecriture.svg";
    } else {
      // photo
      return "assets/images/daily_photo.svg";
    }
  }

  static String getChallengeTypeLabel(String challengeType) {
    if (challengeType == CHALLENGE_TYPE_DESSIN) {
      return invitationDefiDessinTitle;
    } else if (challengeType == CHALLENGE_TYPE_AUDIO) {
      return invitationDefiAudioTitle;
    } else if (challengeType == CHALLENGE_TYPE_ECRITURE) {
      return invitationDefiTexteTitle;
    } else {
      // photo
      return invitationDefiPhotoTitle;
    }
  }
}
