import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {this.borderRadius = 30.0,
        required this.child,
        this.padding = const EdgeInsets.all(15.0),
        this.margin = const EdgeInsets.all(0.0),
        this.backgroundColor = const Color.fromRGBO(255, 255, 255, 1)});
  final double borderRadius;
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
          padding: padding,
          child: InkWell(child: Ink(child: child),
              borderRadius: BorderRadius.circular(8)),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15),
                blurRadius: 1,
                offset: Offset(0, 2), // position
              ),
            ],
          )
        );
  }
}