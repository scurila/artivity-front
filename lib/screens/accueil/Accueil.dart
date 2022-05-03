import 'package:artivity_front/screens/accueil/widgets/CreationCard.dart';
import 'package:artivity_front/screens/accueil/widgets/DailyChallengeCard.dart';
import 'package:artivity_front/screens/accueil/widgets/InvitationDefi.dart';
import 'package:artivity_front/screens/widgets/Headbar.dart';
import 'package:artivity_front/screens/widgets/ReusableFilledButton.dart';
import 'package:artivity_front/theme/constants.dart';
import 'package:flutter/material.dart';

import '../../theme/style.dart';

class Accueil extends StatelessWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          /*Container(
            padding: const EdgeInsets.fromLTRB(12, 38, 12, 0),
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/ARTHUR.png', width: 48,),
                const Text(bienvenueHeader + "William" + ' !', style: Styles.pageTitleText,),
                IconButton(onPressed: () {

                }, icon: const Icon(Icons.message))
              ],
            ),
          ),*/
          Headbar(
              leftContainer: Image.asset('assets/images/ARTHUR.png', width: 48,),
              rightContainer: IconButton(onPressed: () {}, icon: const Icon(Icons.message)),
              text: bienvenueHeader + "William" + ' !',
          ),
          SizedBox(child: ReusableFilledButton(textStyle: Styles.accentButtonText, text: createChallengeButtonText, onPressed: (){}, color: Styles.accentColor, border: Styles.noBorder, margin: const EdgeInsets.fromLTRB(10, 8, 10, 10),), width: MediaQuery.of(context).size.width
            ,),
          Container(
            height: MediaQuery.of(context).size.height - 179 - 56,
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  children: [
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
                          children: const [
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
                    const DailyChallengeCard(eval: 4, artists: "193", challengeType: CHALLENGE_TYPE_PHOTO, challengeTitle: "Montre moi ton coucher de soleil !",),
                    Container(
                      margin: const EdgeInsets.fromLTRB(12, 6, 12, 16),
                      width: MediaQuery.of(context).size.width,
                      child: Text(creationsTitle, style: Styles.labelText, textAlign: TextAlign.left,),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                      child: Column( // cards
                        children: [
                          Row(
                            children: const [
                              CreationCard(title: "Un chaton dans la rue", author: "Jean C.", date: "14/02/2022", imgUrl: "assets/images/creation_placeholder.png"),
                              CreationCard(title: "Un chaton dans la rue", author: "Jean C.", date: "14/02/2022", imgUrl: "assets/images/creation_placeholder.png"),
                            ],
                          ),
                          Row(
                            children: const [
                              CreationCard(title: "Un chaton dans la rue", author: "Jean C.", date: "14/02/2022", imgUrl: "assets/images/creation_placeholder.png"),
                              CreationCard(title: "Un chaton dans la rue", author: "Jean C.", date: "14/02/2022", imgUrl: "assets/images/creation_placeholder.png"),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

        ],
      );
  }
}


