import 'package:artivity_front/screens/widgets/EditBarDefi.dart';
import 'package:artivity_front/theme/style.dart';
import 'package:flutter/material.dart';

import '../../theme/constants.dart';
import '../widgets/Headbar.dart';
import '../widgets/Popup.dart';

class DefiLitteraire extends StatelessWidget {
  const DefiLitteraire({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: Column(
                children: [
                  Headbar(rightContainer: Image.asset('assets/images/Artivity.png', width: 44,),//Image.asset('assets/images/ARTHUR.png', width: 48,),
                      text: defiLitteraireText,
                      leftContainer: const BackButton()),

                  Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(title.toUpperCase(), textAlign: TextAlign.center,style: Styles.challengeTitle),
                        IconButton(onPressed: (){
                          showDialog(
                          context: context,
                          builder: (BuildContext context) => Popup(title: title, description: description,),
                          ); },
                            icon: const Icon(Icons.expand_circle_down_outlined,color: Colors.black)),

                    ]
                  ),
                  Container(height: 2,width: 100,
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                    decoration: const BoxDecoration(color: Colors.black),),
                  Text("2:32", style: Styles.TimerText, textAlign: TextAlign.center),// todo timer !!
                  const SizedBox(height: 10),
                  Container(height: MediaQuery.of(context).size.height*60/100, width: MediaQuery.of(context).size.width*85/100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:Border.all(color: Colors.black)
                      ),
                    child: Scrollbar(
                        child: SingleChildScrollView(
                          child: Column(
                            children:[
                            Text(uneditableText1, style: Styles.challengeTimePink),
                            Container(
                              width: MediaQuery.of(context).size.width*85/100,
                                child: TextField(maxLines: null,
                                  keyboardType: TextInputType.multiline, decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  focusColor: Styles.accentColor,
                                  border: InputBorder.none,
                                ),)
                            ),
                            Text(uneditableText2, style: Styles.challengeTimePink),
                              Container(
                                  width: MediaQuery.of(context).size.width*85/100,
                                  child: TextField(maxLines: null,
                                    keyboardType: TextInputType.multiline, decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      focusColor: Styles.accentColor,
                                      border: InputBorder.none,
                                    ),)
                              ),
                      ])
                        )
                    ),

                  ),

                  const EditBarDefi(),
                ]
            ),
        )
    );
  }
}
