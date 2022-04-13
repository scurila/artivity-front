import 'package:artivity_front/screens/widgets/Headbar.dart';
import 'package:artivity_front/screens/widgets/ReturnButton.dart';
import 'package:artivity_front/theme/constants.dart';
import 'package:flutter/material.dart';

class Connexion extends StatelessWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(

          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Headbar(
                  leftContainer: Container(child: ReturnButton(onPressed: () {})),
                  text: ouvertureHeadbarText,
                  //rightContainer: Container(child: Icon(Icons.arrow_forward))),
                  rightContainer: Container()),
              Container(
                padding: const EdgeInsets.fromLTRB(6, 58, 6, 0),
                child: Image.asset(
                  'assets/images/Artivity.png',
                  width: 200,
                  height: 200,
                ),
              ),
            ],
          ),
        ));
  }
}
