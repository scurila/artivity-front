import 'package:artivity_front/screens/resultat_defi/widget/CreationParticipantsCard.dart';
import 'package:artivity_front/screens/widgets/Headbar.dart';
import 'package:artivity_front/screens/widgets/ReturnButton.dart';
import 'package:artivity_front/theme/constants.dart';
import 'package:flutter/material.dart';

import '../../theme/style.dart';
import '../widgets/ReusableFilledButton.dart';

class ResultatDefi extends StatelessWidget {
  ResultatDefi({Key? key, required this.type,required this.author,required this.date,required this.description,required this.eval, required this.artistsCount}) : super(key: key);
  final String type;
  final String author;
  final String date;
  final String description;
  final int eval;
  final String artistsCount;
  int evalTaNote = 4; // todo : temp

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                // ----- App bar -----
                Headbar(
                    leftContainer: const ReturnButton(),
                    text: "Résultats du défi",
                    rightContainer: Image.asset('assets/images/ARTHUR.png', width:48)),
                Container(
                  height: MediaQuery.of(context).size.height - 123 - 40,
                  child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                            const SizedBox(height: 20),
                            // ----- Defi -----
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              width: MediaQuery.of(context).size.width - 20,
                              decoration: BoxDecoration(color: Styles.accentColor,borderRadius: const BorderRadius.all(const Radius.circular(15))),
                              child: Column( // cards
                                children: [
                                  Text( "Un défi "+type+" de "+author,textAlign: TextAlign.center,style: Styles.challegeResult),
                                  const SizedBox(height: 10),
                                  Text( description,textAlign: TextAlign.left,style: Styles.challegeResultDescription)
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text( "En attente de participants jusqu’au "+date+"...",textAlign: TextAlign.center,style: Styles.challengeResultWait),

                            const SizedBox(height: 5),

                            // ----- Evaluation -----
                            Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.star, color: (eval >= 1? Styles.accentColor : Styles.greyedOutColor), size: 16,),
                                    Icon(Icons.star, color: (eval >= 2? Styles.accentColor : Styles.greyedOutColor), size: 16),
                                    Icon(Icons.star, color: (eval >= 3? Styles.accentColor : Styles.greyedOutColor), size: 16),
                                    Icon(Icons.star, color: (eval >= 4? Styles.accentColor : Styles.greyedOutColor), size: 16),
                                    Icon(Icons.star, color: (eval >= 5? Styles.accentColor : Styles.greyedOutColor), size: 16),
                                    Text(" " + artistsCount + artistsLabel, style: Styles.evaluationChallengeText, ),
                                    Text("  |  "+ gradeLabel, style: Styles.evaluationChallengeText, ),
                                    Icon(Icons.star, color: (evalTaNote >= 1? Styles.accentColor : Styles.greyedOutColor), size: 16,),
                                    Icon(Icons.star, color: (evalTaNote >= 2? Styles.accentColor : Styles.greyedOutColor), size: 16),
                                    Icon(Icons.star, color: (evalTaNote >= 3? Styles.accentColor : Styles.greyedOutColor), size: 16),
                                    Icon(Icons.star, color: (evalTaNote >= 4? Styles.accentColor : Styles.greyedOutColor), size: 16),
                                    Icon(Icons.star, color: (evalTaNote >= 5? Styles.accentColor : Styles.greyedOutColor), size: 16),
                                     //Text("Test" +artistsCount+ artistsLabel,style: Styles.evaluationText,),
                                  ],
                                ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              margin: const EdgeInsets.fromLTRB(20, 0, 10, 10),
                              child:
                                const TextField (
                                  //margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Laisser un commentaire sur le défi...'
                                  ),
                                ),
                            ),
                    // ----- Inviter -----
                            SizedBox(child: ReusableFilledButton(textStyle: Styles.accentButtonText, text: "Inviter des amis", onPressed: (){}, color: Styles.accentColor, border: Styles.noBorder, margin: const EdgeInsets.fromLTRB(10, 8, 10, 10),), width: MediaQuery.of(context).size.width
                              ,),
                            const SizedBox(height: 10),
                            // ----- Créations participants
                            Container(
                              margin: const EdgeInsets.fromLTRB(12, 6, 12, 16),
                              width: MediaQuery.of(context).size.width,
                              child: Text("Créations des participants", style: Styles.labelText, textAlign: TextAlign.left,),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                              width: MediaQuery.of(context).size.width,
                              child: Column( // cards
                                children: [
                                  Row(
                                    children: [
                                      CreationParticipantsCard(isDone: true, author: "Jean C.", date: "14/02/2022", imgUrl: "assets/images/creation_placeholder.png"),
                                      CreationParticipantsCard(isDone: true, author: "Jean C.", date: "14/02/2022", imgUrl: "assets/images/creation_placeholder.png"),
                                      //CreationParticipantsCard(title: "Un chaton dans la rue", author: "Jean C.", date: "14/02/2022", imgUrl: "assets/images/creation_placeholder.png"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      CreationParticipantsCard(isDone: true, author: "Jean C.", date: "14/02/2022", imgUrl: "assets/images/creation_placeholder.png"),
                                      CreationParticipantsCard(isDone: false, author: "Jean C.", date: "14/02/2022", imgUrl: "assets/images/creation_placeholder.png"),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ]
                    ),
                    ),
                  ),
                ),
              ],
            ),
        ),
    );
  }
}
