import 'package:artivity_front/screens/presentation_defi/PresentationDefi.dart';
import 'package:artivity_front/screens/widgets/ReusableCard.dart';
import 'package:artivity_front/theme/constants.dart';
import 'package:artivity_front/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InvitationDefi extends StatelessWidget {
  const InvitationDefi({Key? key, required this.challengeType, required this.invitedBy, required this.executionTime, required this.leftTime, required this.eval, required this.artists}) : super(key: key);
  final String challengeType;
  final String invitedBy;
  final String executionTime;
  final String leftTime;
  final int eval;
  final String artists;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(9),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PresentationDefi(type:challengeType)),
        );
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
                padding: const EdgeInsets.only(bottom: 24),
                child: Text(Styles.getChallengeTypeLabel(challengeType), style: Styles.challengeTitle, textAlign: TextAlign.left,),
              ),
              Text(invitedByText + invitedBy, style: Styles.challengeInvitedBy,),
              Row(
                children: [
                  Text(executionTime + minutes, style: Styles.challengeTimeBlack),
                  const Text(" • "),
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
