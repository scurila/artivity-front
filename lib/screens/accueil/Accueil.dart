import 'package:artivity_front/screens/accueil/widgets/InvitationDefi.dart';
import 'package:artivity_front/screens/widgets/ReusableCard.dart';
import 'package:artivity_front/screens/widgets/ReusableFilledButton.dart';
import 'package:artivity_front/theme/constants.dart';
import 'package:flutter/material.dart';

import '../../theme/style.dart';

class Accueil extends StatelessWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(12, 38, 12, 0),
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/ARTHUR.png', width: 48,),
                Text(bienvenueHeader + "William" + ' !', style: Styles.pageTitleText,),
                IconButton(onPressed: () {

                }, icon: const Icon(Icons.search_rounded))
              ],
            ),
          ),
          SizedBox(child: ReusableFilledButton(textStyle: Styles.accentButtonText, text: createChallengeButtonText, onPressed: (){}, color: Styles.accentColor, border: Styles.noBorder, margin: EdgeInsets.fromLTRB(10, 16, 10, 16),), width: MediaQuery.of(context).size.width
            ,),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.fromLTRB(12, 0, 12, 16),
            child: Text(invitationsHeader, style: Styles.labelText, textAlign: TextAlign.left,),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 280,
            child: Scrollbar(
              child: ListView(
                padding: EdgeInsets.only(bottom: 10),
                scrollDirection: Axis.horizontal,
                children: [
                  InvitationDefi(),
                  InvitationDefi(),
                  InvitationDefi(),
                  InvitationDefi(),
                  InvitationDefi(),
                  InvitationDefi(),
                  InvitationDefi(),


                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


