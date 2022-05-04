import 'package:flutter/material.dart';
import 'package:artivity_front/screens/widgets/Headbar.dart';
import 'package:artivity_front/screens/consulter_amis/widgets/Friend.dart';
import 'package:artivity_front/screens/widgets/ReturnButton.dart';


class ConsulterAmis extends StatelessWidget {
  const ConsulterAmis({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
            children: [
              // ----- App bar -----
              Headbar(
                  leftContainer: const ReturnButton(),
                  text: "Mes amis",
                  rightContainer: Image.asset('assets/images/search.png', width:48)),

              Container(
                height: MediaQuery.of(context).size.height - 123 - 40,
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Column(
                        children: [
                          const SizedBox(height: 10),
                          // ----- Ami -----
                          Friend(name: "Willy Wonka", imgUrl: "assets/images/ARTHUR.png"),
                          Friend(name: "Waluidgi", imgUrl: "assets/images/ARTHUR.png"),
                          Friend(name: "Oh Wait", imgUrl: "assets/images/ARTHUR.png"),
                          Friend(name: "Albus Dumbledore", imgUrl: "assets/images/ARTHUR.png"),
                          Friend(name: "Barbara Streinsand", imgUrl: "assets/images/ARTHUR.png"),
                          Friend(name: "Alex Martin", imgUrl: "assets/images/ARTHUR.png"),
                          Friend(name: "Harry Potter", imgUrl: "assets/images/ARTHUR.png"),
                          Friend(name: "Toto", imgUrl: "assets/images/ARTHUR.png"),
                          Friend(name: "Alexander", imgUrl: "assets/images/ARTHUR.png"),


                        ]
                    ),
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}
