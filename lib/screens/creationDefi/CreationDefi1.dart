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
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  child: Headbar(leftContainer: Container(child: const ReturnButton()), rightContainer: Image.asset('assets/images/ARTHUR.png', width: 48,), text: '✏️ Création d’un défi')
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    TypeDefiCard(title: defiDessin, description: descriptionDefiDessin, challengeType: CHALLENGE_TYPE_DESSIN,),
                    TypeDefiCard(title: defiLitteraire, description: descriptionDefiLitteraire, challengeType: CHALLENGE_TYPE_LITTERAIRE,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    TypeDefiCard(title: defiAudio, description: descriptionDefiAudio, challengeType: CHALLENGE_TYPE_AUDIO,),
                    TypeDefiCard(title: defiPhoto, description: descriptionDefiPhoto, challengeType: CHALLENGE_TYPE_PHOTO,),
                  ],
                ),

                SizedBox(
                    width: MediaQuery.of(context).size.width - 50,
                    child: ReusableFilledButton(textStyle: Styles.accentButtonText, text: boutonDefiAleatoire, onPressed: (){}, color: Styles.accentColor, border: Styles.noBorder, margin: const EdgeInsets.fromLTRB(10, 8, 10, 10),)
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
