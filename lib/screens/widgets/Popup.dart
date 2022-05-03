import 'package:artivity_front/theme/constants.dart';
import 'package:flutter/material.dart';

class Popup extends StatelessWidget {
  const Popup({
    Key? key,
    required this.title,
    required this.description,
  }): super(key: key);
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(titrePopup),
      scrollable: true,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          const Text(enoncePopup),
          Text(title),
          const Text(''),
          const Text(descriptionPopup),
          Text(description),
        ],
      ),

      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
