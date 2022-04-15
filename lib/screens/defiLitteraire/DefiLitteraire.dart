import 'package:artivity_front/theme/style.dart';
import 'package:flutter/material.dart';

import '../../theme/constants.dart';
import '../widgets/Headbar.dart';

class DefiLitteraire extends StatelessWidget {
  const DefiLitteraire({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
                children: [
                  Headbar(leftContainer: Image.asset('assets/images/ARTHUR.png', width: 48,), text: defiLitteraireText, rightContainer: Container()),

                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(title.toUpperCase(), textAlign: TextAlign.center,style: Styles.challengeTitle),
                        IconButton(onPressed: (){}, icon: Icon(Icons.expand_circle_down_outlined,color: Colors.black)),

                    ]
                  ),
                  Container(height: 2,width: 100,
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    decoration: const BoxDecoration(color: Colors.black),),
                  Text(timer, style: Styles.TimerText, textAlign: TextAlign.center),// todo timer !!
                  SizedBox(height: 10),
                  Container(height: MediaQuery.of(context).size.height*60/100, width: MediaQuery.of(context).size.width*85/100,
                      child: Column(children:[
                        /*Text(uneditableText1, style: Styles.challengeTimePink),
                        SizedBox(height: MediaQuery.of(context).size.height*60/100, width: MediaQuery.of(context).size.width*85/100, child: TextField( maxLines: 100, decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          focusColor: Styles.accentColor,
                          border: InputBorder.none,
                        ),)),
                        Text(uneditableText2, style: Styles.challengeTimePink),*/
                      ]),

                  ),


                  /*SizedBox(height: MediaQuery.of(context).size.height*60/100, width: MediaQuery.of(context).size.width*85/100, child: TextField( maxLines: 100, decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    focusColor: Styles.accentColor,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: new OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Styles.accentColor
                      ),
                    ),
                  ),)),*/
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [

                      IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.upload_file)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.download)),
                      IconButton(onPressed: (){}, icon: Icon(Icons.send)),
                    ],
                  )
                  /*
                  Row(),//ligne de boutons

                  Row()//barre du bas*/


                ]
            ),
        )
    );
  }
}
