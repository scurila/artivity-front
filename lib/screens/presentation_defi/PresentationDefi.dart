import 'package:artivity_front/screens/defiLitteraire/DefiLitteraire.dart';
import 'package:artivity_front/screens/widgets/Headbar.dart';
import 'package:artivity_front/screens/widgets/ReturnButton.dart';
import 'package:artivity_front/screens/presentation_defi/widgets/Defi.dart';
import 'package:artivity_front/theme/constants.dart';
import 'package:flutter/material.dart';

import '../../theme/style.dart';
import '../widgets/ReusableFilledButton.dart';

class PresentationDefi extends StatelessWidget {
  const PresentationDefi({Key? key}) : super(key: key);

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
                  leftContainer: Image.asset('assets/images/ARTHUR.png', width: 48,),
                  text: "William Shakespeare",
                  rightContainer: Container()),
              Container(
                height: MediaQuery.of(context).size.height - 123,
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          // ----- Type défi + infos -----
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            decoration: BoxDecoration(color: Styles.accentColor,borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Column(
                              children: [
                                Defi(challengeType: CHALLENGE_TYPE_ECRITURE, invitedBy: "Chris D.", executionTime: "2", leftTime: "2h", eval: 2, artists: "122345",),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),

                          Container(
                            padding: EdgeInsets.only(left: 20.0),
                            width: MediaQuery.of(context).size.width,
                              child: Text("Commentaires artiste",textAlign: TextAlign.left ,style: Styles.challengeDescription)
                          ),
                          SizedBox(height: 10),

                          // ----- Commentaires + scrollbar -----
                          Container(
                            height: 120,
                            child: Scrollbar(
                              child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                              // ----- Commentaire -----
                                            Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                  child: Image.asset('assets/images/ARTHUR.png', width: 48,),
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context).size.width - 80,
                                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                                  decoration: BoxDecoration(color: Styles.greyedOutColor,borderRadius: BorderRadius.all(Radius.circular(15)),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      //Image.asset('assets/images/ARTHUR.png', width: 48,),
                                                      Container(
                                                          padding: EdgeInsets.only(left: 5.0),
                                                          width: MediaQuery.of(context).size.width,
                                                          child: Text("Super défi !",textAlign: TextAlign.left ,style: Styles.challengeDescription)
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ]
                                            ),

                                            // ----- Commentaire -----
                                            Row(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                    child: Image.asset('assets/images/ARTHUR.png', width: 48,),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(context).size.width - 80,
                                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                                    decoration: BoxDecoration(color: Styles.greyedOutColor,borderRadius: BorderRadius.all(Radius.circular(15)),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        //Image.asset('assets/images/ARTHUR.png', width: 48,),
                                                        Container(
                                                            padding: EdgeInsets.only(left: 5.0),
                                                            width: MediaQuery.of(context).size.width,
                                                            child: Text("Bonne idée, Will :D",textAlign: TextAlign.left ,style: Styles.challengeDescription)
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ]
                                            ),

                                            // ----- Commentaire -----
                                            Row(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                    child: Image.asset('assets/images/ARTHUR.png', width: 48,),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(context).size.width - 80,
                                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                                    decoration: BoxDecoration(color: Styles.greyedOutColor,borderRadius: BorderRadius.all(Radius.circular(15)),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                            padding: EdgeInsets.only(left: 5.0),
                                                            width: MediaQuery.of(context).size.width,
                                                            child: Text("Défi à ne pas rater ! :) ",textAlign: TextAlign.left ,style: Styles.challengeDescription)
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ]
                                            ),

                                            // ----- Commentaire -----
                                            Row(
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                    child: Image.asset('assets/images/ARTHUR.png', width: 48,),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(context).size.width - 80,
                                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                                    decoration: BoxDecoration(color: Styles.greyedOutColor,borderRadius: BorderRadius.all(Radius.circular(15)),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                            padding: EdgeInsets.only(left: 5.0),
                                                            width: MediaQuery.of(context).size.width,
                                                            child: Text(" 2h n'est pas assez pour ce défi...",textAlign: TextAlign.left ,style: Styles.challengeDescription)
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ]
                                            ),
                                        ]
                                    ),
                                ),
                            ),
                          ),
                          SizedBox(height: 20),

                          // ----- Description ------
                          Container(
                              padding: EdgeInsets.only(left: 20.0),
                              width: MediaQuery.of(context).size.width,
                              child: Text("Description",textAlign: TextAlign.left ,style: Styles.challengeDescription)
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width - 5,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            decoration: BoxDecoration(color: Styles.greyedOutColor,borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width - 15,
                                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                      children: [
                                        Text("Jean V. " + Defi.descriptionDefiInvitation + "poésie collaborative"
                                        + Defi.descriptionDefiCollaboratifJoin +"(Alexandre R., Maria T., Kevin B.)"
                                        + Defi.descriptionDefiCollaboratifCompose + " une poésie unique et créative sur « musique, sons, sonorités »." + "\n"
                                        + Defi.descriptionDefiTexteCollaboratif),
                                      ],
                                    ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),

                          // ----- Bouton commencer défi -----
                          SizedBox(
                            child: ReusableFilledButton(
                              textStyle: Styles.accentButtonText,
                              text: presentationDefiCommencer.toUpperCase(),
                              onPressed: () {},
                              color: Styles.accentColor,
                              border: Styles.noBorder,
                              margin: EdgeInsets.fromLTRB(60, 0, 60, 0),
                            ),
                            width: MediaQuery.of(context).size.width,
                          ),
                          SizedBox(height: 15),
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

