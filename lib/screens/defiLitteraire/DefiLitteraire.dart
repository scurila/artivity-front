import 'package:artivity_front/theme/style.dart';
import 'package:flutter/material.dart';

import '../../theme/constants.dart';
import '../widgets/Headbar.dart';

class DefiLitteraire extends StatelessWidget {
  const DefiLitteraire({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
                children: [
                  Headbar(leftContainer: Image.asset('assets/images/ARTHUR.png', width: 48,), text: defiLitteraireText, rightContainer: Container()),

                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(title.toUpperCase(), textAlign: TextAlign.center,style: Styles.challengeTitle),
                        IconButton(onPressed: (){}, icon: Icon(Icons.expand_circle_down_outlined,color: Colors.black)),
                    ]
                  ),
                  Container(height: 2,width: 100,
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    decoration: const BoxDecoration(color: Colors.black),)
                  /*Text(),//timer
                  TextField(),//zone d'écriture
                  Row(),//ligne de boutons
                  Row()//barre du bas*/


                ]
            ),
        )
    );
  }
}
