import 'package:flutter/material.dart';

import '../../theme/style.dart';

class ReturnButton extends StatelessWidget {
  ReturnButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back,color: Colors.black)
      ),
    );


  }
}