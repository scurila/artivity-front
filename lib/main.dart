import 'package:artivity_front/screens/accueil/Accueil.dart';
import 'package:artivity_front/screens/creation/creation.dart';
import 'package:artivity_front/screens/inscription/Inscription.dart';
import 'package:artivity_front/screens/ouverture/Ouverture.dart';
import 'package:artivity_front/screens/presentation_defi/PresentationDefi.dart';
import 'package:artivity_front/screens/widgets/BackExitProtection.dart';
import 'package:artivity_front/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(// pas de paysage pour l'instant
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Artivity',
      theme: Styles.baseTheme,
      //home: const BackExitProtection(child: Accueil()),
      //home: const BackExitProtection(child: PresentationDefi()),
      //home: const BackExitProtection(child: Creation()),
      home: const BackExitProtection(child: Ouverture()),
      //home: const BackExitProtection(child: Inscription()),


    );
  }
}

