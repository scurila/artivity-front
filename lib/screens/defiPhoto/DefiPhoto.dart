import 'dart:io';

import 'package:artivity_front/screens/widgets/Popup.dart';
import 'package:artivity_front/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../theme/constants.dart';
import '../widgets/Headbar.dart';

class DefiPhoto extends StatefulWidget {
  const DefiPhoto({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String title;
  final String description;

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
                      IconButton(onPressed: (){
                        // todo : submit
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
