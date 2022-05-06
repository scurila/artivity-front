import 'dart:convert';
import 'dart:typed_data';

import 'package:artivity_front/screens/defiAudio/DefiAudio.dart';
import 'package:artivity_front/screens/defiPhoto/DefiPhoto.dart';
import 'package:artivity_front/screens/defiVideo/DefiVideo.dart';
import 'package:artivity_front/screens/defiLitteraire/DefiLitteraire.dart';
import 'package:artivity_front/screens/widgets/Headbar.dart';
import 'package:artivity_front/screens/presentation_defi/widgets/Defi.dart';
import 'package:artivity_front/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import '../../services/UserBackendService.dart';
import '../../services/objects/Challenge.dart';
import '../../services/objects/ChallengeSubmission.dart';
import '../../theme/style.dart';
import '../defiDessin/DefiDessin.dart';
import '../resultat_defi/widget/CreationParticipantsCard.dart';
import '../widgets/ReusableFilledButton.dart';

class PresentationDefi extends StatelessWidget {
  PresentationDefi({
    Key? key,
    required this.type,
    this.chal,
    required this.submissions
  }) : super(key: key);
  final String type;
  final Challenge? chal;
  List<ChallengeSubmission> submissions;

  @override
  Widget build(BuildContext context) {
    // load creations
    List<Widget> submissionCards = [];
    Widget rowElemA = Container(), rowElemB = Container();
    for (var i = 0; i < submissions.length; i++) {
      Uint8List? f = (submissions[i].b64data != null? base64.decode(submissions[i].b64data!) : null);
      Uint8List? data = f;
      String? imgPath = null;
      if (chal!.type != CHALLENGE_TYPE_DESSIN && chal!.type != CHALLENGE_TYPE_PHOTO) {
        f = null;
        if (chal!.type == CHALLENGE_TYPE_AUDIO) imgPath = 'assets/images/speaker.png';
        if (chal!.type == CHALLENGE_TYPE_LITTERAIRE) imgPath = 'assets/images/Dairy.png';
      }
      if (i%2 == 0) {
        rowElemA = CreationParticipantsCard(isDone: (submissions[i].b64data != null), author: submissions[i].user_pseudo, date: DateFormat('dd-MM-yyyy').format(DateTime.fromMillisecondsSinceEpoch(submissions[i].start_time*1000, isUtc: true)).toString(), imgFile: f, imgUrl: imgPath, data: data, type: chal!.type);
      } else {
        rowElemB = CreationParticipantsCard(isDone: (submissions[i].b64data != null), author: submissions[i].user_pseudo, date: DateFormat('dd-MM-yyyy').format(DateTime.fromMillisecondsSinceEpoch(submissions[i].start_time*1000, isUtc: true)).toString(), imgFile: f, imgUrl: imgPath, data: data, type: chal!.type);
      }
      if (i%2 != 0 && i > 0) {
        submissionCards.add(Row(
          children: [rowElemA, rowElemB],
        ));
      }
    }
    if (submissions.length % 2 != 0) submissionCards.add(Row(children: [rowElemA],));


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
                  leftContainer: const BackButton(),
                  text: UserBackendService.currentPseudo,
                  rightContainer: Image.asset('assets/images/Artivity.png', height: 44,)),
              Container(
                height: MediaQuery.of(context).size.height - 123 ,
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          // ----- Bouton commencer défi -----
                          SizedBox(
                            child: ReusableFilledButton(
                              textStyle: Styles.accentButtonText,
                              text: presentationDefiCommencer.toUpperCase(),
                              onPressed: () {
                                //TODO : defi par type
                                UserBackendService.startChallenge(chal!.id);
                                print(type);
                                if(type == CHALLENGE_TYPE_LITTERAIRE){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DefiLitteraire(title: chal!.title, description: chal!.subject,)),
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
                                    MaterialPageRoute(builder: (context) => DefiAudio(title: chal!.title, description: chal!.subject, chal: chal!,)),
                                  );
                                }
                                if(type == CHALLENGE_TYPE_VIDEO){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DefiVideo(title: chal!.title, description: chal!.subject,)),
                                  );
                                }
                                if(type == CHALLENGE_TYPE_PHOTO){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DefiPhoto(title: chal!.title, description: chal!.subject, chal: chal!,)),
                                  );
                                }
                                if (type == CHALLENGE_TYPE_DESSIN) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DefiDessin(title: chal!.title, description: chal!.subject, chal: chal!,)),
                                  );
                                }

                              },
                              color: Styles.accentColor,
                              border: Styles.noBorder,
                              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            ),
                            width: MediaQuery.of(context).size.width,
                          ),
                          const SizedBox(height: 15),
                          // ----- Type défi + infos -----
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                            decoration: BoxDecoration(color: Styles.accentColor,borderRadius: const BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Column(
                              children: [
                                Defi(challengeType: chal!.type, executionTime: (chal!.timelimit == null? 'Pas de chrono' : chal!.timelimit!.toString() + ' sec'), leftTime: (chal!.leftTime == null? 'autant de temps que tu veux' : (chal!.leftTime!/60/60 < 1? (chal!.leftTime!/60).floor().toString() + " min" : (chal!.leftTime!/60/60).floor().toString() + "h")), eval: chal!.rating, artists: chal!.answer_count.toString(),),
                              ],
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
                            decoration: BoxDecoration(color: Styles.accentColor,borderRadius: const BorderRadius.all(Radius.circular(15)),
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
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('Titre : ', style: TextStyle(fontWeight: FontWeight.bold),),
                                          Text(chal!.title + '\n')
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text('Énoncé : ', style: const TextStyle(fontWeight: FontWeight.bold),),
                                          Text(chal!.subject)
                                        ],
                                      ),
                                      //Text( + '\n\n' + chal!.title + '\n\n' + chal!.subject),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),

                          // ----- Commentaires + scrollbar -----
                          Container(
                              padding: const EdgeInsets.only(left: 20.0),
                              width: MediaQuery.of(context).size.width,
                              child: Text("Commentaires des artistes",textAlign: TextAlign.left ,style: Styles.challengeDescription)
                          ),
                          const SizedBox(height: 10),
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

                          // ----- Créations participants
                          Container(
                            margin: const EdgeInsets.fromLTRB(12, 6, 12, 16),
                            width: MediaQuery.of(context).size.width,
                            child: Text("Créations des participants", style: Styles.challengeDescription, textAlign: TextAlign.left,),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            width: MediaQuery.of(context).size.width,
                            child: Column( // cards
                              children: submissionCards
                            ),
                          ),
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

