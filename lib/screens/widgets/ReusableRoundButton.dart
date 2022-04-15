import 'package:artivity_front/screens/widgets/ReusableFilledButton.dart';
import 'package:flutter/material.dart';

class ReusableRoundButton extends StatelessWidget {

  const ReusableRoundButton({
    required this.size,
    required this.image,
    required this.onPressed,
    required this.color,
    this.padding = const EdgeInsets.symmetric(vertical: 20.0),
    required this.border,
    this.gradient,
    this.align = false,
    this.margin,
  });
  final double size;
  final Icon image;
  final void Function() onPressed;
  final Color color;
  final EdgeInsets padding;
  final BoxBorder border;
  final LinearGradient? gradient;
  final bool align;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient,
        border: border,
        borderRadius: BorderRadius.circular(size),
      ),
      margin: margin,
      child: MaterialButton(
        child: image,
        onPressed: onPressed,
        color: (gradient != null)? null : color,
        shape: const CircleBorder(),
        padding: padding,
      ),
    );
  }
}
