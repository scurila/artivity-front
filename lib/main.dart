import 'package:artivity_front/screens/accueil/Accueil.dart';
import 'package:artivity_front/screens/creation/creation.dart';
import 'package:artivity_front/screens/defiAudio/DefiAudio.dart';
import 'package:artivity_front/screens/defiPhoto/DefiPhoto.dart';
import 'package:artivity_front/screens/defiVideo/DefiVideo.dart';
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
      home: const BackExitProtection(child: DefiAudio(title: "Bonjour, mon amour", description: "Je t'aimerai plus que quiconque t'a déjà aimé. Je serai là, jour et nuit, je serai là, à tes côtés, car il y a une bonne raison pour laquelle les astronomes passent leur nuit à observer les étoiles. Et cette raison, je la comprends quand je te regarde. On m'a dit un jour que l'amour me frappereait à la figure comme la batte du joueur de baseball frappe la balle pour l'envoyer hors de cette Terre. Au moment où je t'ai vu, j'ai senti un bleu sur mon visage, un oeil au beurre noir annonciateur de bonheur. Un présage douloureux et délicieux, qui a projeté mon âme en dehors des limites du terrain du connu. Je plonge dans un inconnu terrifiant et envoûtant à chaque fois que je plonge dans ton regard. Cet océan de rêve, j'aimerais ne jamais en sortir.",)),
    );
  }
}

