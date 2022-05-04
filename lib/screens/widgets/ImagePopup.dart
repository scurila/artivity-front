import 'dart:typed_data';

import 'package:artivity_front/theme/constants.dart';
import 'package:flutter/material.dart';

class ImagePopup extends StatelessWidget {
  ImagePopup({
    Key? key,
    required this.imgData,
    required this.pseudo,
  }): super(key: key);
  String pseudo;
  Uint8List imgData;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Création de " + pseudo),
      scrollable: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.memory(imgData, height: MediaQuery.of(context).size.height * 0.5,)
        ],
      ),

      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Fermer'),
        ),
      ],
    );
  }
}
