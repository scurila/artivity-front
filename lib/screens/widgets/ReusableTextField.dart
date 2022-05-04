import 'package:flutter/material.dart';

class ReusableTextField extends StatelessWidget {
  const ReusableTextField(
      {Key? key, this.borderRadius = 30.0,
        required this.child,
        this.padding = const EdgeInsets.all(15.0),
        this.margin = const EdgeInsets.all(0.0),
        this.backgroundColor = const Color.fromRGBO(255, 255, 255, 1)}) : super(key: key);
  final double borderRadius;
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color backgroundColor;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width/3,
      child: const Material(
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          autofocus: false,
        ),
      ),
    );
  }
}
