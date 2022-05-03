import 'package:artivity_front/screens/widgets/ReusableCard.dart';
import 'package:flutter/material.dart';

import '../../../theme/style.dart';

class DefiCard extends StatelessWidget {
  const DefiCard({Key? key, required this.title, required this.imgUrl}) : super(key: key);
  final String title;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right: 5),
      height: 170,
      width: MediaQuery.of(context).size.width/2 - 35,
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
                  Image.asset(imgUrl, height: 95,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(title, style: Styles.challengeTitle, textAlign: TextAlign.left,),
            ),
          ],
        ),
      ),
    );
  }
}
