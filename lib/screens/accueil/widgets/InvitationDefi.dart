import 'package:artivity_front/screens/widgets/ReusableCard.dart';
import 'package:artivity_front/theme/constants.dart';
import 'package:artivity_front/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InvitationDefi extends StatelessWidget {
  const InvitationDefi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  SvgPicture.asset('assets/images/defi_dessin.svg', width: 130,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Text(invitationDefiDessinTitle, style: Styles.challengeTitle, textAlign: TextAlign.left,),
            ),
            Text(invitedBy + " Élodie C.", style: Styles.challengeInvitedBy,),
            Row(
              children: [
                Text("5" + minutes, style: Styles.challengeTimeBlack),
                const Text(" • "),
                Text(timeLeft + "22h" + " !", style: Styles.challengeTimePink,),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.star, color: Styles.accentColor, size: 14,),
                  Icon(Icons.star, color: Styles.accentColor, size: 14),
                  Icon(Icons.star, color: Styles.accentColor, size: 14),
                  Icon(Icons.star, color: Styles.accentColor, size: 14),
                  Icon(Icons.star, color: Styles.greyedOutColor, size: 14),
                  Text(" "+ "12345" + artists, style: Styles.evaluationText, )
                ],
              ),
            )
            //EvaluationRow()
          ],
        )
      ),
    );
  }
}
