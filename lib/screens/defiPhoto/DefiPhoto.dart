import 'dart:convert';
import 'dart:io';

import 'package:artivity_front/screens/widgets/Popup.dart';
import 'package:artivity_front/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

import '../../services/UserBackendService.dart';
import '../../services/objects/Challenge.dart';
import '../../theme/constants.dart';
import '../resultat_defi/ResultatDefi.dart';
import '../widgets/Headbar.dart';

class DefiPhoto extends StatefulWidget {
  DefiPhoto({
    Key? key,
    required this.title,
    required this.description,
    required this.chal
  }) : super(key: key);
  final String title;
  final String description;
  Challenge chal;

  @override
  State<DefiPhoto> createState() => _DefiPhotoState();
}

class _DefiPhotoState extends State<DefiPhoto> {
  File? currentBgFile;

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
              children: [
                Headbar(rightContainer: Image.asset('assets/images/ARTHUR.png', width: 48,), text: defiDessin, leftContainer: const BackButton()),

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
                Text("2:32", style: Styles.TimerText, textAlign: TextAlign.center),// todo timer !!
                const SizedBox(height: 10),


                Container(
                  child: (currentBgFile == null? Image.asset('assets/images/background.png') : Image.file(currentBgFile!)),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.7,
                ),

                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(onPressed: () async {
                        final ImagePicker _picker = ImagePicker();
                        // Pick an image
                        final XFile? image = await _picker.pickImage(source: ImageSource.camera);
                        setState(() {
                          currentBgFile = File(image!.path);
                        });
                      }, icon: const Icon(Icons.camera_alt_outlined)),
                      IconButton(onPressed: () async {

                        final ImagePicker _picker = ImagePicker();
                        // Pick an image
                        final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                        // todo : check if submitted
                        setState(() {
                          currentBgFile = File(image!.path);
                        });
                      }, icon: const Icon(Icons.upload_file)),
                      IconButton(onPressed: () async {
                        // todo : submit
                        if (currentBgFile != null) {
                          final bytes = currentBgFile!.readAsBytesSync();
                          String img64 = base64.encode(bytes);

                          try {
                            await UserBackendService.submitChallenge(img64, widget.chal.id);

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
                        }
                      }, icon: const Icon(Icons.send)),
                    ],
                  ),
                ),
              ]
          ),
        )
    );
  }
}
