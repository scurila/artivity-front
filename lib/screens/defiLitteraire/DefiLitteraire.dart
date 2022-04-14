import 'package:flutter/material.dart';

import '../../theme/constants.dart';
import '../widgets/Headbar.dart';

class DefiLitteraire extends StatelessWidget {
  const DefiLitteraire({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(

            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
                children: [
                  Headbar(leftContainer: Container(), text: defiLitteraireText, rightContainer: Container()),
                  /*Row(),//titre du défi
                  Text(),//timer
                  TextField(),//zone d'écriture
                  Row(),//ligne de boutons
                  Row()//barre du bas*/


                ]
            ),
        )
    );
  }
}
