import 'package:artivity_front/screens/widgets/ReusableCard.dart';
import 'package:artivity_front/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../theme/style.dart';

class DailyChallengeCard extends StatelessWidget {
  DailyChallengeCard({Key? key, required this.eval, required this.artists, required this.challengeType, required this.challengeTitle}) : super(key: key);
  int eval;
  String artists;
  String challengeTitle;
  String challengeType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 8, 10, 8),
      child: ReusableCard(
          borderRadius: 9,
          backgroundColor: Styles.accentColor,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
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
                    SvgPicture.asset('assets/images/daily_photo.svg', width: 170,),
                  ],
                ),
                Text(challengeTitle, style: Styles.challengeTitleBig),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 6, bottom: 12),
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
                    SvgPicture.asset('assets/images/daily.svg', width: 80,)
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}
