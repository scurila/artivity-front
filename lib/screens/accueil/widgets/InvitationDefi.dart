import 'package:artivity_front/screens/presentation_defi/PresentationDefi.dart';
import 'package:artivity_front/screens/widgets/ReusableCard.dart';
import 'package:artivity_front/theme/constants.dart';
import 'package:artivity_front/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../services/UserBackendService.dart';
import '../../../services/objects/Challenge.dart';

class InvitationDefi extends StatelessWidget {
  const InvitationDefi({Key? key, required this.challengeType, required this.title, required this.executionTime, required this.leftTime, required this.eval, required this.artists, required this.id}) : super(key: key);
  final String challengeType;
  final String executionTime;
  final String leftTime;
  final String title;
  final int eval;
  final String artists;
  final int id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(9),
      onTap: () async {
        try {
          Challenge c = await UserBackendService.loadChallenge(id);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  PresentationDefi(type: challengeType, chal: c,)), // todo : temp
          );
        } catch (e) {

        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        child: ReusableCard(
          borderRadius: 9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 160,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Styles.getChallengeTypePicture(challengeType), width: 130,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(title, style: Styles.challengeTitle, textAlign: TextAlign.left,),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Styles.getChallengeTypeLabel(challengeType), textAlign: TextAlign.left,),
                  Text(executionTime , style: Styles.challengeTimeBlack),
                  Text(timeLeft + leftTime + " !", style: Styles.challengeTimePink,),
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
                    Text(" " + artists + artistsLabel, style: Styles.evaluationText, )
                  ],
                ),
              )
              //EvaluationRow()
            ],
          )
        ),
      ),
    );
  }
}
