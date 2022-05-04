
import 'package:artivity_front/screens/accueil/Accueil.dart';
import 'package:artivity_front/screens/communaute/Communaute.dart';
import 'package:artivity_front/screens/consulter_amis/ConsulterAmis.dart';
import 'package:artivity_front/screens/creation/creation.dart';
import 'package:artivity_front/screens/defiAudio/DefiAudio.dart';
import 'package:artivity_front/screens/ouverture/Ouverture.dart';
import 'package:artivity_front/screens/mon_profil/MonProfil.dart';
import 'package:artivity_front/screens/presentation_defi/PresentationDefi.dart';
import 'package:artivity_front/screens/resultat_defi/ResultatDefi.dart';
import 'package:artivity_front/screens/consulter_amis/widgets/MyStatefulWidget.dart';
import 'package:artivity_front/screens/widgets/BackExitProtection.dart';
import 'package:artivity_front/screens/defiPhoto/DefiPhoto.dart';
import 'package:artivity_front/screens/defiVideo/DefiVideo.dart';
import 'package:artivity_front/theme/style.dart';
import 'package:artivity_front/screens/creationDefi/CreationDefi1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/defiDessin/DefiDessin.dart';

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
      home:

      const BackExitProtection(child: Ouverture()),

           //const  BackExitProtection(child: ConsulterAmis()),

    );
  }
}

