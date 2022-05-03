import 'package:artivity_front/screens/widgets/ReusableCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../theme/style.dart';

class TypeDefiCard extends StatelessWidget {
  const TypeDefiCard({Key? key, required this.title, required this.description, required this.challengeType}) : super(key: key);
  final String title;
  final String description;
  final String challengeType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 2, bottom: 2, left: 2, right: 2),
      width: MediaQuery.of(context).size.width/2 - 14,
      height: MediaQuery.of(context).size.height*35/100,
      child: ReusableCard(
        borderRadius: 9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 160,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(Styles.getChallengeTypePicture(challengeType), width: MediaQuery.of(context).size.width*35/100,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(title, style: Styles.challengeTitle, textAlign: TextAlign.left,),
            ),
            Text(description)
          ],
        ),
      ),
    );
  }
}
