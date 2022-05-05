import 'dart:convert';
import 'dart:io';

import 'package:artivity_front/screens/resultat_defi/ResultatDefi.dart';
import 'package:artivity_front/services/UserBackendService.dart';
import 'package:artivity_front/services/objects/Challenge.dart';
import 'package:artivity_front/theme/style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../../theme/constants.dart';
import '../widgets/Headbar.dart';
import '../widgets/Popup.dart';

class DefiLitteraire extends StatefulWidget {
  DefiLitteraire({
    Key? key,
    required this.title,
    required this.description,
    required this.chal,
  }) : super(key: key);
  final String title;
  final String description;
  Challenge chal;

  @override
  State<DefiLitteraire> createState() => _DefiLitteraireState();
}

class _DefiLitteraireState extends State<DefiLitteraire> {
  File? currentBgFile;
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
                children: [
                  Headbar(rightContainer: Image.asset('assets/images/Artivity.png', width: 44,),//Image.asset('assets/images/ARTHUR.png', width: 48,),
                      text: defiLitteraireText,
                      leftContainer: const BackButton()),

                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.title.toUpperCase(), textAlign: TextAlign.center,style: Styles.challengeTitle),
                        IconButton(onPressed: (){
                          showDialog(
                          context: context,
                          builder: (BuildContext context) => Popup(title: widget.title, description: widget.description,),
                          ); },
                            icon: const Icon(Icons.expand_circle_down_outlined,color: Colors.black)),

                    ]
                  ),
                  Container(height: 2,width: 100,
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    decoration: const BoxDecoration(color: Colors.black),),
                  const SizedBox(height: 10),

                  Container(height: MediaQuery.of(context).size.height*60/100, width: MediaQuery.of(context).size.width*85/100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:Border.all(color: Colors.black)
                      ),
                    child: Scrollbar(
                        child: SingleChildScrollView(
                          child: Column(
                            children:[
                            //Text(uneditableText1, style: Styles.challengeTimePink),
                            Container(
                              width: MediaQuery.of(context).size.width*85/100,
                                child: TextField(maxLines: null,
                                  controller: myController,
                                  keyboardType: TextInputType.multiline, decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  focusColor: Styles.accentColor,
                                  border: InputBorder.none,
                                ),)
                            ),
                            //Text(uneditableText2, style: Styles.challengeTimePink),
                              /**
                              Container(
                                  width: MediaQuery.of(context).size.width*85/100,
                                  child: TextField(maxLines: null,
                                    keyboardType: TextInputType.multiline, decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      focusColor: Styles.accentColor,
                                      border: InputBorder.none,
                                    ),)
                              ),*/
                      ])
                        )
                    ),

                  ),

              Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      /// Delete
                      IconButton(onPressed: (){
                        myController.clear();
                      }, icon: const Icon(Icons.delete_outline)),

                      /// Download
                      IconButton(onPressed: () async {
                        Fluttertoast.showToast(
                          msg: "Création enregistrée sur l'appareil !",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Styles.accentColor,
                          textColor: Colors.black,
                        );
                      }, icon: const Icon(Icons.download)),

                      /// Submit
                      IconButton(onPressed: () async {
                        final directory = (await getApplicationDocumentsDirectory()).path;
                        await Directory('$directory/sample').create(recursive: true);
                        final fullPath = '$directory/sample/${DateTime.now().millisecondsSinceEpoch}.txt';
                        final txtFile = File('$fullPath');
                        txtFile.writeAsString(myController.text);
                        final bytes = txtFile.readAsBytesSync();
                        String txt64 = base64.encode(bytes);

                        try {
                          await UserBackendService.submitChallenge(txt64, widget.chal.id);

                          Fluttertoast.showToast(
                            msg: 'Envoi de ta création !',
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.SNACKBAR,
                            backgroundColor: Styles.accentColor,
                            textColor: Colors.black,
                          );
                          // todo : fermer et peut pas retour (pop)
                          var submissions = await UserBackendService.challengeSubmissions(widget.chal.id);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ResultatDefi(type: Styles.getChallengeTypeLabel(widget.chal.type), author: widget.chal.user_created_pseudo, date: DateFormat('dd-MM-yyyy').format(DateTime.fromMillisecondsSinceEpoch(widget.chal.start_time*1000, isUtc: true)).toString(), description: widget.chal.subject, eval: widget.chal.rating, artistsCount: widget.chal.answer_count.toString(), chalId: widget.chal.id, submissions: submissions, chalType: widget.chal.type,)),
                          );
                        } catch (e) {
                          print(e.toString());
                          if (e.toString() == "Exception: SubmitChallengeError") {
                            Fluttertoast.showToast(
                              msg: 'Vous avez déjà envoyé une solution pour ce défi.',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Styles.accentColor,
                              textColor: Colors.black,
                            );
                          } else {
                            Fluttertoast.showToast(
                              msg: 'La création n\'a pas pu être envoyée.',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              backgroundColor: Styles.accentColor,
                              textColor: Colors.black,
                            );
                          }

                        }

                      }, icon: const Icon(Icons.send)),
                    ],
                  )
              ),
                ]
            ),
        )
    );
  }
}
