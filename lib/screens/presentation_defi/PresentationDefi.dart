import 'package:artivity_front/screens/defiAudio/DefiAudio.dart';
import 'package:artivity_front/screens/defiPhoto/DefiPhoto.dart';
import 'package:artivity_front/screens/defiVideo/DefiVideo.dart';
import 'package:artivity_front/screens/defiLitteraire/DefiLitteraire.dart';
import 'package:artivity_front/screens/widgets/Headbar.dart';
import 'package:artivity_front/screens/presentation_defi/widgets/Defi.dart';
import 'package:artivity_front/theme/constants.dart';
import 'package:flutter/material.dart';

import '../../services/objects/Challenge.dart';
import '../../theme/style.dart';
import '../defiDessin/DefiDessin.dart';
import '../widgets/ReusableFilledButton.dart';

class PresentationDefi extends StatelessWidget {
  const PresentationDefi({
    Key? key,
    required this.type,
    this.chal,
  }) : super(key: key);
  final String type;
  final Challenge? chal;

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(
          width: MediaQuery.of(context).size.width - 5,
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          decoration: const BoxDecoration(color: Colors.white),

          child: Column(
            children: [

              // ----- App bar -----
              Headbar(
                  leftContainer: BackButton(),
                  text: "William Shakespeare",
                  rightContainer: Image.asset('assets/images/ARTHUR.png', height: 48,)),
              Container(
                height: MediaQuery.of(context).size.height - 123 ,
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          // ----- Type défi + infos -----
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            decoration: BoxDecoration(color: Styles.accentColor,borderRadius: const BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Column(
                              children: [
                                Defi(challengeType: chal!.type, invitedBy: "Chris D.", executionTime: (chal!.timelimit == null? 'Pas de chrono' : chal!.timelimit!.toString() + ' sec'), leftTime: "2h", eval: 2, artists: "122345",),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),

                          Container(
                            padding: const EdgeInsets.only(left: 20.0),
                            width: MediaQuery.of(context).size.width,
                              child: Text("Commentaires artiste",textAlign: TextAlign.left ,style: Styles.challengeDescription)
                          ),
                          const SizedBox(height: 10),

                          // ----- Commentaires + scrollbar -----
                          Container(
                            height: 140,
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
                                                  width: MediaQuery.of(context).size.width - 90,
                                                  margin: const EdgeInsets.symmetric(horizontal: 10),
                                                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                                  decoration: BoxDecoration(color: Styles.greyedOutColor,borderRadius: const BorderRadius.all(Radius.circular(15)),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      //Image.asset('assets/images/ARTHUR.png', width: 48,),
                                                      Container(
                                                          padding: const EdgeInsets.only(left: 5.0),
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
                                                    width: MediaQuery.of(context).size.width - 90,
                                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                                    decoration: BoxDecoration(color: Styles.greyedOutColor,borderRadius: const BorderRadius.all(Radius.circular(15)),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        //Image.asset('assets/images/ARTHUR.png', width: 48,),
                                                        Container(
                                                            padding: const EdgeInsets.only(left: 5.0),
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
                                                    width: MediaQuery.of(context).size.width - 90,
                                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                                    decoration: BoxDecoration(color: Styles.greyedOutColor,borderRadius: const BorderRadius.all(Radius.circular(15)),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                            padding: const EdgeInsets.only(left: 5.0),
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
                                                    width: MediaQuery.of(context).size.width - 90,
                                                    margin: const EdgeInsets.symmetric(horizontal: 10),
                                                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                                                    decoration: BoxDecoration(color: Styles.greyedOutColor,borderRadius: const BorderRadius.all(Radius.circular(15)),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                            padding: const EdgeInsets.only(left: 5.0),
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
                          const SizedBox(height: 20),

                          // ----- Description ------
                          Container(
                              padding: const EdgeInsets.only(left: 20.0),
                              width: MediaQuery.of(context).size.width,
                              child: Text("Description",textAlign: TextAlign.left ,style: Styles.challengeDescription)
                          ),
                          const SizedBox(height: 10),
                          Container(
                            width: MediaQuery.of(context).size.width - 5,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            decoration: BoxDecoration(color: Styles.greyedOutColor,borderRadius: const BorderRadius.all(Radius.circular(15)),
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
                          const SizedBox(height: 15),

                          // ----- Bouton commencer défi -----
                          SizedBox(
                            child: ReusableFilledButton(
                              textStyle: Styles.accentButtonText,
                              text: presentationDefiCommencer.toUpperCase(),
                              onPressed: () {
                                //TODO : defi par type
                                print(type);
                                if(type == CHALLENGE_TYPE_LITTERAIRE){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const DefiLitteraire(title: "Un texte sans 'e'", description: "Pour ceux qui ont la ref ;)",)),
                                  );
                                }
                                /*if(type == CHALLENGE_TYPE_DESSIN){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const DefiDessin(title: "Dessine moi un mouton")),
                                  );
                                }*/
                                if(type == CHALLENGE_TYPE_AUDIO){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const DefiAudio(title: "Ambiance sonore feu de bois", description: "",)),
                                  );
                                }
                                if(type == CHALLENGE_TYPE_VIDEO){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const DefiVideo(title: "Video emotion", description: "Sometimes the best caption, is no caption at all...",)),
                                  );
                                }
                                if(type == CHALLENGE_TYPE_PHOTO){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const DefiPhoto(title: "Clair obscur", description: "Rembrandt représente",)),
                                  );
                                }
                                if (type == CHALLENGE_TYPE_DESSIN) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const DefiDessin(title: "Clair obscur", description: "Rembrandt représente",)),
                                  );
                                }

                              },
                              color: Styles.accentColor,
                              border: Styles.noBorder,
                              margin: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                            ),
                            width: MediaQuery.of(context).size.width,
                          ),
                          const SizedBox(height: 15),
                      ]
                    ),
                    ),
                  ),
          ),]

        ),
    ),
    );
  }
}

