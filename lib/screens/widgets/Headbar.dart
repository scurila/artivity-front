import 'package:artivity_front/theme/style.dart';
import 'package:flutter/material.dart';

class Headbar extends StatelessWidget {
  const Headbar({
    Key? key,
    required this.leftContainer,
    required this.rightContainer,
    required this.text,
    this.textStyle = Styles.pageTitleText,
    this.color= Colors.white,
    this.expanding = false,
    this.onPressed,


}): super(key: key);
  final TextStyle textStyle;
  final String text;
  final Color color;
  final Container leftContainer;
  final Container rightContainer;
  final bool expanding;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: color,
            leading:  leftContainer,
            title:Text(text, textAlign: TextAlign.center, style: textStyle,),centerTitle: true,
            actions: [
              if(expanding)IconButton(onPressed: onPressed, icon: const Icon(Icons.arrow_downward,color: Colors.black)),
              rightContainer,
            ],

          ),
        ),


    );
  }
}
//scaffold avec 3 container

/*child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ,
            Text(text, textAlign: TextAlign.center, style: textStyle,
            ),
            rightContainer,
            ],
        ),*/

//,

/*     child: Scaffold(
          body: Center(
            child : Text(text, textAlign: TextAlign.center, style: textStyle,
             ),
          )

        )*/