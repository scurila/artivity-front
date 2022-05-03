import 'package:artivity_front/screens/widgets/Headbar.dart';
import 'package:artivity_front/screens/widgets/ReturnButton.dart';
import 'package:artivity_front/screens/creationDefi/widgets/TypeDefiCard.dart';
import 'package:artivity_front/screens/widgets/ReusableFilledButton.dart';
import 'package:flutter/material.dart';

import '../../theme/style.dart';
import '../../theme/constants.dart';

class CreationDefi1 extends StatelessWidget {
  const CreationDefi1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Column(
        children: [
          Container(
            child: Headbar(leftContainer: Container(child: const ReturnButton()), rightContainer: Image.asset('assets/images/ARTHUR.png', width: 48,), text: '✏️ Création d’un défi')
          ),

          Row(
            children: const [
              TypeDefiCard(title: defiDessin, description: descriptionDefiDessin, imgUrl: 'assets/images/defi_dessin.svg',),
              TypeDefiCard(title: defiEcriture, description: descriptionDefiEcriture, imgUrl: 'assets/images/defi_ecriture.svg',),
            ],
          ),
          Row(
            children: const [
              TypeDefiCard(title: defiAudio, description: descriptionDefiAudio, imgUrl: 'assets/images/defi_audio.svg',),
              TypeDefiCard(title: defiPhoto, description: descriptionDefiPhoto, imgUrl: 'assets/images/defi_photo.svg',),
            ],
          ),
          
          ReusableFilledButton(textStyle: Styles.accentButtonText, text: boutonDefiAleatoire, onPressed: (){}, color: Styles.accentColor, border: Styles.noBorder, margin: const EdgeInsets.fromLTRB(10, 8, 10, 10),)
        ],
      ),
    );
  }
}
