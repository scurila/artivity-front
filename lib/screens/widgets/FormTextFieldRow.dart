import 'package:artivity_front/theme/style.dart';
import 'package:flutter/material.dart';

class FormTextFieldRow extends StatelessWidget {
  const FormTextFieldRow({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 20, width: MediaQuery.of(context).size.width*3/10, child: Text(text.toUpperCase(), style: Styles.labelText, textAlign: TextAlign.center)),
          SizedBox(height: 40, width: MediaQuery.of(context).size.width*45/100, child: TextField( decoration: InputDecoration(
              fillColor: Styles.greyedColor,
              filled: true,
              focusColor: Styles.accentColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Styles.greyedColor),
              ),
            focusedBorder: new UnderlineInputBorder(
              borderSide: BorderSide(
                  color: Styles.accentColor
              ),
            ),
          ),)),
        ],
      ),
    );
  }
}
