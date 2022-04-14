import 'package:artivity_front/screens/widgets/Headbar.dart';
import 'package:artivity_front/screens/widgets/ReturnButton.dart';
import 'package:artivity_front/screens/widgets/ReusableCard.dart';
import 'package:artivity_front/screens/widgets/ReusableTextField.dart';
import 'package:artivity_front/theme/constants.dart';
import 'package:flutter/material.dart';

import '../../theme/style.dart';
import '../widgets/ReusableFilledButton.dart';

class Creation extends StatelessWidget {
  const Creation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(

          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Headbar(
                  leftContainer: Container(child: ReturnButton(onPressed: () {})),
                  text: "Un chaton dans la rue",
                 // rightContainer: Container(child: Icon(Icons.arrow_forward))),
                  rightContainer: Container()),
              ReusableCard(
                child: Column(
                  children: [
                    Row(

                     // crossAxisAlignment: CrossAxisAlignment.start,
                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Expanded(
                        child: Container(
                          child: Image.asset(
                            'assets/images/cat.png',
                            width: 150,
                            height: 150,
                          ),
                        )
                      )],
                    ),
                    SizedBox(height: 5),
                    Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Container(
                              child: Image.asset(
                                'assets/images/ARTHUR.png',
                                width: 60,
                                height: 60,
                              ),
                            ),
                        ),

                        Text("Willy Wonka \n 13/04/2021",style: Styles.labelText),
                        SizedBox(height: 20, width: 20,child:TextField( decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          focusColor: Styles.accentColor,
                          border: InputBorder.none,
                        ),)),
                        IconButton(icon: Icon(Icons.favorite,),iconSize: 40,
                          color: Colors.red,
                          splashColor: Colors.purple,
                          onPressed: () {},),
                        Text("200",style: Styles.labelText),

                        SizedBox(height: 20, width: 50,child:TextField( decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          focusColor: Styles.accentColor,
                          border: InputBorder.none,
                        ),)),
                      ],
                    ),


                  ],
                ),
              ),
              Container(
                  height: 200.0,
                child: ListView(
                padding: const EdgeInsets.all(8),

                children: <Widget>[
                  Container(
                    height: 50,
                    color: Colors.amber[600],
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/ARTHUR.png',
                          width: 60,
                          height: 60,
                        ),
                        const Center(child: Text('Comment A')),
                     ],
                    ),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[500],
                      child: Row(
                          children:[
                            Image.asset(
                              'assets/images/ARTHUR.png',
                              width: 60,
                              height: 60,
                            ),
                           const Center(child: Text('Comment B')),
                            ],
                      ),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[500],
                    child: Row(
                      children:[
                        Image.asset(
                          'assets/images/ARTHUR.png',
                          width: 60,
                          height: 60,
                        ),
                        const Center(child: Text('Comment B')),
                        ],
                    ),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[500],
                    child: Row(
                      children:[
                        Image.asset(
                          'assets/images/ARTHUR.png',
                          width: 60,
                          height: 60,
                        ),
                        const Center(child: Text('Comment B')),
                        ],
                    ),
                  ),
                  Container(
                    height: 50,
                    color: Colors.amber[500],
                    child: Row(
                       children:[
                         Image.asset('assets/images/ARTHUR.png',
                           width: 60,
                           height: 60,
                         ),
                          const Center(child: Text('Comment B')),

   ],
    ),
    ),

            ],
          ),

        ),
              Container(
                height: 50,
                color: Colors.amber[100],
                child: Row(
                  children:[
                    ReusableTextField(child: Text(ecrireCommentaire, style: Styles.accentButtonText,),),
                    Image.asset('assets/images/ARTHUR.png',
                      width: 60,
                      height: 60,
                    )
                  ],
                ),
              ),

  ],
    ),
    ),
    );
  }
}

