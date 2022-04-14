import 'package:artivity_front/screens/widgets/ReusableCard.dart';
import 'package:flutter/material.dart';

import '../../../theme/constants.dart';
import '../../../theme/style.dart';

class CreationCard extends StatelessWidget {
  CreationCard({Key? key, required this.title, required this.author, required this.date, required this.imgUrl}) : super(key: key);
  String title;
  String author;
  String date;
  String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 2, bottom: 2, left: 2, right: 2),
      width: MediaQuery.of(context).size.width/2 - 14,
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
              padding: const EdgeInsets.only(bottom: 24),
              child: Text(title, style: Styles.challengeTitle, textAlign: TextAlign.left,),
            ),
            Text(creationOf + author, style: Styles.challengeInvitedBy,),
            Text(date)
          ],
        ),
      ),
    );
  }
}
