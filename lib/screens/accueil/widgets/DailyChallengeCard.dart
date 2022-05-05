import 'package:artivity_front/screens/widgets/ReusableCard.dart';
import 'package:artivity_front/services/UserBackendService.dart';
import 'package:artivity_front/services/objects/Challenge.dart';
import 'package:artivity_front/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../theme/style.dart';
import '../../presentation_defi/PresentationDefi.dart';

class DailyChallengeCard extends StatelessWidget {
  const DailyChallengeCard({Key? key, required this.eval, required this.artists, required this.challengeType, required this.challengeTitle, required this.id}) : super(key: key);
  final int eval;
  final String artists;
  final String challengeTitle;
  final String challengeType;
  final int id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(9),
      onTap: () async {
        try {
          Challenge c = await UserBackendService.loadChallenge(id);
          var submissions = await UserBackendService.challengeSubmissions(id);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  PresentationDefi(type: challengeType, chal: c, submissions: submissions,)), // todo : temp
          );
        } catch (e) {

        }
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 8, 10, 8),
        child: ReusableCard(
            borderRadius: 9,
            backgroundColor: Styles.accentColor,
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 0, top: 8),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 277,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          dailyChallengeTitle,
                          style: Styles.dailyChallengeTitleText,
                        ),
                      ),
                      SvgPicture.asset('assets/images/daily_photo.svg', width: 160,),
                    ],
                  ),
                  Text(challengeTitle, style: Styles.challengeTitleBig),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 6, bottom: 12),
                              child: Text(Styles.getChallengeTypeLabel(challengeType), style: Styles.challengeTitle,)),
                          Row(
                            children: [
                              Icon(Icons.star, color: (eval >= 1? Colors.black : Styles.greyedOutColor), size: 14,),
                              Icon(Icons.star, color: (eval >= 2? Colors.black : Styles.greyedOutColor), size: 14),
                              Icon(Icons.star, color: (eval >= 3? Colors.black : Styles.greyedOutColor), size: 14),
                              Icon(Icons.star, color: (eval >= 4? Colors.black : Styles.greyedOutColor), size: 14),
                              Icon(Icons.star, color: (eval >= 5? Colors.black : Styles.greyedOutColor), size: 14),
                              Text(" " + artists + artistsLabel, style: Styles.evaluationText, )
                            ],
                          ),
                        ],
                      ),
                      Image.asset('assets/images/daily.png', height: 90,)
                    ],
                  )
                ],
              ),
            )
        ),
      ),
    );
  }
}
