import 'package:flutter/material.dart';

class ReusableFilledButton extends StatelessWidget {
  const ReusableFilledButton({Key? key,
    required this.textStyle,
    required this.text,
    required this.onPressed,
    required this.color,
    this.borderRadius = 11.0,
    this.padding = const EdgeInsets.symmetric(vertical: 20.0),
    required this.border,
    this.shadow = true,
    this.gradient,
    this.align = false,
    this.margin,
  }) : super(key: key);
  final TextStyle textStyle;
  final String text;
  final void Function() onPressed;
  final Color color;
  final double borderRadius;
  final EdgeInsets padding;
  final BoxBorder border;
  final bool shadow;
  final LinearGradient? gradient;
  final bool align;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        border: border,
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: (shadow)? [
          const BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.15),
            blurRadius: 1,
            offset: Offset(0, 2), // position
          )
        ]
            :
        null,
      ),
      margin: margin,
      child: MaterialButton(
        child: Text(
          text,
          style: textStyle,
          textAlign: (align)? TextAlign.center : TextAlign.start,
        ),
        onPressed: onPressed,
        color: (gradient != null)? null : color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
      ),
    );
  }
}