import 'package:artivity_front/screens/widgets/ReusableTextField.dart';
import 'package:flutter/material.dart';

import '../../theme/constants.dart';
import '../../theme/style.dart';

class Inscription extends StatelessWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(23, 138, 23, 0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Styles.greyedOutColor),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(6, 38, 6, 0),
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(inscriptionPseudo, style: Styles.sloganText,),
                ReusableTextField(child: Text(inscriptionTextField, style: Styles.accentButtonText,),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
