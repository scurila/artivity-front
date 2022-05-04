import 'package:artivity_front/theme/constants.dart';
import 'package:artivity_front/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Defi extends StatelessWidget {
  const Defi({Key? key, required this.challengeType, required this.executionTime, required this.leftTime, required this.eval, required this.artists}) : super(key: key);
  final String challengeType;
  final String executionTime;
  final String leftTime;
  final int eval;
  final String artists;

  static String descriptionDefiInvitation = "  t’a invité à participer à un défi de ";
  static String descriptionDefiCollaboratifJoin = " Rejoins ses autres amis ";
  static String descriptionDefiCollaboratifCompose = " et composez ";

  static String descriptionDefiTexteCollaboratif = "\nNotifies tes amis quand tu as apporté des changements au texte initial, envoies-leur un message pour discuter sur les changements à faire et tes idées !";


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0.3),
      child: Container(
        height: 150,
        margin: const EdgeInsets.symmetric(horizontal: 0.3),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
          Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Styles.getChallengeTypePicture(challengeType), width: 130,),
            ],
            ),
          ),
            Expanded(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(Styles.getChallengeTypeLabel(challengeType), style: Styles.challengeTitle, textAlign: TextAlign.left,),
                ),
                const SizedBox(height: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(executionTime, style: Styles.challengeTimeBlack, textAlign: TextAlign.start,),
                    Text(timeLeft + leftTime + " !", style: Styles.challengeTimePink, textAlign: TextAlign.start,),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.star, color: (eval >= 1? Styles.accentColor : Styles.greyedOutColor), size: 14,),
                      Icon(Icons.star, color: (eval >= 2? Styles.accentColor : Styles.greyedOutColor), size: 14),
                      Icon(Icons.star, color: (eval >= 3? Styles.accentColor : Styles.greyedOutColor), size: 14),
                      Icon(Icons.star, color: (eval >= 4? Styles.accentColor : Styles.greyedOutColor), size: 14),
                      Icon(Icons.star, color: (eval >= 5? Styles.accentColor : Styles.greyedOutColor), size: 14),
                      Text(" " + artists + artists, style: Styles.evaluationText, )
                    ],
                  ),
                )
                //EvaluationRow()
                ],
              ),
            )
          ],
    ),
    ),

    );
  }
}
