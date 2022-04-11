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
            padding: const EdgeInsets.fromLTRB(6, 38, 6, 0),
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Image.asset('assets/images/ARTHUR.png', width: 48,),
                ),
                Text(bienvenueHeader + "William" + ' !', style: Styles.pageTitleText,),
                IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded))
              ],
            ),
          ),
          SizedBox(child: ReusableFilledButton(textStyle: Styles.accentButtonText, text: createChallengeButtonText, onPressed: (){}, color: Styles.accentColor, border: Styles.noBorder, margin: EdgeInsets.fromLTRB(10, 16, 10, 16),), width: MediaQuery.of(context).size.width
            ,)
        ],
      ),
    );
  }
}
