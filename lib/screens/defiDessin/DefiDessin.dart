import 'dart:io';

import 'package:artivity_front/screens/widgets/EditBarDefi.dart';
import 'package:artivity_front/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_painter/image_painter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:open_file/open_file.dart';

import '../../theme/constants.dart';
import '../defiAudio/widget/drawing.dart';
import '../widgets/Headbar.dart';

class DefiDessin extends StatefulWidget {
  const DefiDessin({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  State<DefiDessin> createState() => _DefiDessinState();
}

class _DefiDessinState extends State<DefiDessin> {
  String currentBgPath = "assets/images/background.png";
  File? currentBgFile = null;
  GlobalKey<ImagePainterState> gKey = GlobalKey<ImagePainterState>();

  void saveImage() async {
    final image = await gKey.currentState?.exportImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    await Directory('$directory/sample').create(recursive: true);
    final fullPath =
        '$directory/sample/${DateTime.now().millisecondsSinceEpoch}.png';
    final imgFile = File('$fullPath');
    imgFile.writeAsBytesSync(image!);
    GallerySaver.saveImage(fullPath);
    Fluttertoast.showToast(
      msg: 'Création enregistrée dans la galerie !',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      backgroundColor: Styles.accentColor,
      textColor: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
              children: [
                Headbar(leftContainer: Image.asset('assets/images/ARTHUR.png', width: 48,), text: defiPhotoText, rightContainer: Container(width: 48, height: 48,)),

                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(widget.title.toUpperCase(), textAlign: TextAlign.center,style: Styles.challengeTitle),
                      IconButton(onPressed: (){}, icon: Icon(Icons.expand_circle_down_outlined,color: Colors.black)),

                    ]
                ),
                Container(height: 2,width: 100,
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  decoration: const BoxDecoration(color: Colors.black),),
                Text(timer, style: Styles.TimerText, textAlign: TextAlign.center),// todo timer !!
                SizedBox(height: 10),


                Container(
                  child: Dessin(bgFile: currentBgFile, bgPath: currentBgPath, gKey: gKey,),
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
                          gKey = GlobalKey<ImagePainterState>(); // refresh
                        });
                      }, icon: Icon(Icons.camera_alt_outlined)),
                      IconButton(onPressed: () async {

                        final ImagePicker _picker = ImagePicker();
                        // Pick an image
                        final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                        // todo : check if submitted
                        setState(() {
                          currentBgFile = File(image!.path);
                          gKey = GlobalKey<ImagePainterState>(); // refresh
                        });
                      }, icon: Icon(Icons.upload_file)),
                      IconButton(onPressed: (){
                          saveImage();
                      }, icon: Icon(Icons.download)),
                      IconButton(onPressed: (){
                        // todo : submit
                      }, icon: Icon(Icons.send)),
                    ],
                  ),
                ),
              ]
          ),
        )
    );
  }
}
