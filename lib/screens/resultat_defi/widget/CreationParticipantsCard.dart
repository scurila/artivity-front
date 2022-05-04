import 'package:artivity_front/screens/widgets/ReusableCard.dart';
import 'package:flutter/material.dart';

import '../../../theme/constants.dart';
import '../../../theme/style.dart';

class CreationParticipantsCard extends StatelessWidget {
  CreationParticipantsCard({Key? key, required this.isDone ,required this.author, required this.date, required this.imgUrl}) : super(key: key);
  bool isDone;
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
                  Image.asset((isDone ? imgUrl : "assets/images/sand-clock.png"), height: (isDone ? 90 : 70),),
                ],
              ),
            ),
            Text( (isDone ? creationOfDefi : waitingCreationOf) + author, style: Styles.challengeInvitedBy,),
            const SizedBox(height: 5),
            Text("Le "+date)
          ],
        ),
      ),
    );
  }
}
