import 'package:artivity_front/screens/widgets/ReusableCard.dart';
import 'package:flutter/material.dart';

import '../../../theme/constants.dart';
import '../../../theme/style.dart';

class Artwork extends StatelessWidget {
  Artwork({Key? key, required this.author, required this.date, required this.imgUrl}) : super(key: key);
  String author;
  String date;
  String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 2, bottom: 2, left: 2, right: 2),
      width: MediaQuery.of(context).size.width/2 - 17,
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
                  Image.asset(imgUrl , height:  90 ,),
                ],
              ),
            ),
            Text(  creationOfDefi  + author, style: Styles.challengeInvitedBy,),
            const SizedBox(height: 5),
            Text(date)
          ],
        ),
      ),
    );
  }
}