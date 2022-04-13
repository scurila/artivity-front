import 'package:flutter/material.dart';

import '../../theme/style.dart';

class ReturnButton extends StatelessWidget {
  const ReturnButton({
    required this.onPressed,
});
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(Icons.arrow_back,color: Colors.black)
      ),
    );


  }
}