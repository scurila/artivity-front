import 'package:artivity_front/screens/communaute/widgets/DefiCard.dart';
import 'package:artivity_front/screens/widgets/Headbar.dart';
import 'package:artivity_front/screens/widgets/ReturnButton.dart';
import 'package:flutter/material.dart';

import '../../theme/style.dart';

class Communaute extends StatelessWidget {
  const Communaute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        width: MediaQuery.of(context).size.width - 5,
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
            children: [

              // ----- App bar -----
              Headbar(
                  leftContainer: const ReturnButton(),
                  text: "Communauté",
                  rightContainer: Image.asset('assets/images/friends.png', width:48/*height: 10,*/)),
              Container(
                height: MediaQuery.of(context).size.height - 123 - 40,
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Column(
                        children: [

                          const SizedBox(height: 10),
                          // ----- Défis en cours -----
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Image.asset('assets/images/inspiration.png', height: 30,),
                              ),
                              Container(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text("Défis en cours",textAlign: TextAlign.left ,style: Styles.challengeDescription)
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),
                          // ----- Defis en cours -----
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            decoration: BoxDecoration(color: Styles.accentColor,borderRadius: const BorderRadius.all(Radius.circular(15))),
                            child: Column( // cards
                              children: [
                                Row(
                                  children: const [
                                    DefiCard(title: "Un chaton dans la rue", imgUrl: "assets/images/creation_placeholder.png"),
                                    DefiCard(title: "Abstrait", imgUrl: "assets/images/abstrait.png"),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    DefiCard(title: "Un mouton dans le pré", imgUrl: "assets/images/mouton.png"),
                                    //CreationCard(title: "Un chaton dans la rue", author: "Jean C.", date: "14/02/2022", imgUrl: "assets/images/creation_placeholder.png"),
                                  ],
                                )
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),
                          // ----- Texte -----
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Image.asset('assets/images/notification.png', height: 25,),
                              ),
                              Container(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Text("Notifications",textAlign: TextAlign.left ,style: Styles.challengeDescription)
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          // ----- Notifications + scrollbar -----
                          Container(
                            height: 150,
                            child: Scrollbar(
                              child: SingleChildScrollView(
                                child: Column(
                                    children: [

                                      Container(
                                        width: MediaQuery.of(context).size.width - 20,
                                        margin: const EdgeInsets.symmetric(horizontal: 10),
                                        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                        decoration: BoxDecoration(color: Styles.greyedOutColor,borderRadius: const BorderRadius.all(Radius.circular(15)),),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Image.asset('assets/images/ARTHUR.png', width: 48,),
                                            ),
                                            Container(
                                                padding: const EdgeInsets.only(left: 5.0),
                                                width: MediaQuery.of(context).size.width - 87,
                                                child: Text( "Albus D. t’as envoyé un message.",textAlign: TextAlign.left ,style: Styles.notificationDescription)
                                            ),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(height: 10),

                                      // ----- Notification -----
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        margin: const EdgeInsets.symmetric(horizontal: 10),
                                        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                        decoration: BoxDecoration(color: Styles.greyedOutColor,borderRadius: const BorderRadius.all(Radius.circular(15)),
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Image.asset('assets/images/ARTHUR.png', width: 48,),
                                            ),
                                            Container(
                                                padding: const EdgeInsets.only(left: 5.0),
                                                width: MediaQuery.of(context).size.width - 87,
                                                child: Text(" Barbra S. t’as invité à un défi poésie collaborative. Rejoins son équipe ! Sois créatif ! ",textAlign: TextAlign.left ,style: Styles.notificationDescription),
                                            ),
                                          ],
                                        ),
                                      ),

                                      const SizedBox(height: 10),

                                      // ----- Notification -----
                                      Container(
                                        width: MediaQuery.of(context).size.width - 20,
                                        //height: 100,
                                        margin: const EdgeInsets.symmetric(horizontal: 10),
                                        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                        decoration: BoxDecoration(color: Styles.greyedOutColor,borderRadius: const BorderRadius.all(Radius.circular(15)),),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Image.asset('assets/images/ARTHUR.png', width: 48,),
                                            ),
                                            Container(
                                                padding: const EdgeInsets.only(left: 5.0),
                                                width: MediaQuery.of(context).size.width - 87,
                                                child: Text(" Il te reste 30 minutes pour le défi littéraire",textAlign: TextAlign.left ,style: Styles.notificationDescription)
                                            ),
                                          ],
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
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

