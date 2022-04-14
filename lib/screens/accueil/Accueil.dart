import 'package:artivity_front/screens/accueil/widgets/DailyChallengeCard.dart';
import 'package:artivity_front/screens/accueil/widgets/InvitationDefi.dart';
import 'package:artivity_front/screens/widgets/ReusableCard.dart';
import 'package:artivity_front/screens/widgets/ReusableFilledButton.dart';
import 'package:artivity_front/theme/constants.dart';
import 'package:flutter/material.dart';

import '../../theme/style.dart';

class Accueil extends StatelessWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(12, 38, 12, 0),
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/ARTHUR.png', width: 48,),
                Text(bienvenueHeader + "William" + ' !', style: Styles.pageTitleText,),
                IconButton(onPressed: () {

                }, icon: const Icon(Icons.search_rounded))
              ],
            ),
          ),
          SizedBox(child: ReusableFilledButton(textStyle: Styles.accentButtonText, text: createChallengeButtonText, onPressed: (){}, color: Styles.accentColor, border: Styles.noBorder, margin: const EdgeInsets.fromLTRB(10, 16, 10, 16),), width: MediaQuery.of(context).size.width
            ,),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.fromLTRB(12, 0, 12, 16),
            child: Text(invitationsHeader, style: Styles.labelText, textAlign: TextAlign.left,),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 280,
            child: Scrollbar(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 10),
                scrollDirection: Axis.horizontal,
                children: [
                  InvitationDefi(challengeType: CHALLENGE_TYPE_DESSIN, invitedBy: "Élodie C.", executionTime: "5", leftTime: "22h", eval: 4, artists: "12345",),
                  InvitationDefi(challengeType: CHALLENGE_TYPE_PHOTO, invitedBy: "Jean V.", executionTime: "10", leftTime: "12h", eval: 1, artists: "203",),
                  InvitationDefi(challengeType: CHALLENGE_TYPE_ECRITURE, invitedBy: "Chris C.", executionTime: "2", leftTime: "2h", eval: 2, artists: "122345",),
                  InvitationDefi(challengeType: CHALLENGE_TYPE_AUDIO, invitedBy: "Math C.", executionTime: "1", leftTime: "10h", eval: 3, artists: "125",),
                  InvitationDefi(challengeType: CHALLENGE_TYPE_DESSIN, invitedBy: "Ellie C.", executionTime: "9", leftTime: "1h", eval: 5, artists: "1345",),
                  InvitationDefi(challengeType: CHALLENGE_TYPE_PHOTO, invitedBy: "Eric C.", executionTime: "8", leftTime: "4h", eval: 4, artists: "5",),
                  InvitationDefi(challengeType: CHALLENGE_TYPE_ECRITURE, invitedBy: "Ed C.", executionTime: "5", leftTime: "23h", eval: 4, artists: "45",),
                ],
              ),
            ),
          ),
          DailyChallengeCard(eval: 4, artists: "193", challengeType: CHALLENGE_TYPE_PHOTO, challengeTitle: "Montre moi ton coucher de soleil !",),
        ],
      ),
    );
  }
}


