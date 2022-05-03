import 'dart:io';

import 'package:artivity_front/screens/widgets/Popup.dart';
import 'package:artivity_front/screens/widgets/ReusableRoundButton.dart';
import 'package:artivity_front/services/AudioPlayerService.dart';
import 'package:artivity_front/theme/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import '../../theme/style.dart';
import '../widgets/Headbar.dart';

class DefiAudio extends StatefulWidget {
  const DefiAudio({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String title;
  final String description;

  @override
  State<DefiAudio> createState() => _DefiAudioState();
}

class _DefiAudioState extends State<DefiAudio> {
  bool recording = false;
  bool hasARecording = false;
  final record = Record();
  String currentRecordingPath = "";
  bool playing = false;

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
              children: [
                Headbar(leftContainer: Image.asset('assets/images/ARTHUR.png', width: 48,), text: defiAudioText, rightContainer: Container(width: 48, height: 48,)),

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
                          icon: const Icon(Icons.expand_circle_down_outlined, color: Colors.black)),

                    ]
                ),

                Container(height: 2,width: 100,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  decoration: const BoxDecoration(color: Colors.black),),

                Text(timer, style: Styles.TimerText, textAlign: TextAlign.center),// todo timer !!
                SizedBox(height: MediaQuery.of(context).size.height*0.1),
                AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  child: ReusableRoundButton(size: 100, image: Icon(Icons.mic_none, size: 50, color: (recording? Colors.white : Colors.black),), onPressed: () async {
                      // record
                    setState(() {
                      recording = !recording;
                    });
                    if (!recording) {
                      hasARecording = true;
                      await record.stop();
                    }
                    else {
                      // start recording
                      bool result = await record.hasPermission();
                      final directory = (await getApplicationDocumentsDirectory()).path;
                      await Directory('$directory/sample').create(recursive: true);
                      final fullPath =
                          '$directory/sample/${DateTime.now().millisecondsSinceEpoch}.m4a';
                      currentRecordingPath = fullPath;

                      await record.start(
                        path: fullPath,
                        encoder: AudioEncoder.AAC,
                        bitRate: 128000,
                        samplingRate: 44100,
                      );
                    }
                  }, color: (recording? Colors.red : Styles.accentColor), border: Styles.noBorder),
                ),
                Container(child: Text((recording? "Enregistrement en cours ..." : (hasARecording? "Enregistrement prêt.\nRelancer un enregistrement écrasera le précédent !" : "")), style: Styles.TimerText, textAlign: TextAlign.center), margin: EdgeInsets.only(top: 12),),
                SizedBox(height: MediaQuery.of(context).size.height*0.075),
                ReusableRoundButton(size: 100, image: Icon((playing? Icons.multitrack_audio_rounded : Icons.play_arrow), size: 50), onPressed: (){
                  if (hasARecording && !playing) {
                    AudioPlayerService aps = AudioPlayerService();
                    final duration = aps.setPath(filePath: currentRecordingPath);
                    duration.then((value) {
                      Future.delayed(value!, () {
                        setState(() {
                          playing = false;
                        });
                      });
                    });


                    aps.play();
                    setState(() {
                      playing = true;
                    });
                  }
                }, color: (hasARecording? (playing? Colors.green : Styles.accentColor) : Styles.greyedOutColor), border: Styles.noBorder),
                SizedBox(height: MediaQuery.of(context).size.height*0.075),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ReusableRoundButton(size: 80, image: Icon(Icons.download, size: 30), onPressed: (){
                      if (hasARecording) {
                        Fluttertoast.showToast(
                          msg: "Création enregistrée sur l'appareil !",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          backgroundColor: Styles.accentColor,
                          textColor: Colors.black,
                        );
                      }
                    }, color: (hasARecording? Styles.accentColor : Styles.greyedOutColor), border: Styles.noBorder),
                    ReusableRoundButton(size: 80, image: Icon(Icons.upload_file, size: 30), onPressed: () async {
                      FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.audio );
                      if (result != null) {
                        File file = File(result.files.single.path!);

                        setState(() {
                          currentRecordingPath = result.files.single.path!;
                          hasARecording = true;
                        });


                        // todo : update state
                      } else {
                        // rien, l'utilisateur a annulé
                      }

                    }, color: Styles.accentColor, border: Styles.noBorder),
                    ReusableRoundButton(size: 80, image: Icon(Icons.send, size: 30), onPressed: (){}, color: Styles.accentColor, border: Styles.noBorder),
                  ],
                ),


              ]
          ),
        )
    );
  }
}
