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
                  leftContainer: Container(child: ReturnButton()),
                  text: "Un chaton dans la rue",
                  rightContainer: Container(child:
                    IconButton( onPressed: (){},icon: Icon(Icons.expand_circle_down_outlined,color: Colors.black)))),

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
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: MediaQuery.of(context).size.height * 0.4,
                          ),
                        )
                      )],
                    ),
                      SizedBox(height: 5),
                      Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       // Expanded(
                            /*child: */Container(
                              child: Image.asset(
                                'assets/images/ARTHUR.png',
                                width: 60,
                                height: 60,
                              ),
                            ),
                       // ),

                        Text("Willy Wonka \n 13/04/2021",style: Styles.labelText),
                        SizedBox(height: 10, width: 50,child:TextField( decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          focusColor: Styles.accentColor,
                          border: InputBorder.none,
                        ),)),

                        IconButton(icon: Icon(Icons.favorite,),iconSize: 40,
                          color: Colors.grey,
                          splashColor: Colors.black,
                          onPressed: () {},),
                        Text("200",style: Styles.labelText),

                        SizedBox(height: 10, width: 50,child:TextField( decoration: InputDecoration(
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
                  height: MediaQuery.of(context).size.width * 0.4,
                child: ListView(
                  children: [
                    for (var i = 0; i < 10; i++)
                    Container(
                      height: MediaQuery.of(context).size.width * 0.1,
                      color: Colors.white,
                      child: Row(
                        children:[
                          Image.asset(
                          'assets/images/ARTHUR.png',
                          width: 60,
                          height: 60,
                          ),
                          Center(child:DecoratedBox(
                            // chat bubble decoration
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
                            ),
                            child: Padding(
                            padding: const EdgeInsets.all(10),
                              child: Text("comment A",
                              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.black),
                                         ),
                                       ),
                                    ),
                                  ),
                                ],
                              ),
                             ),
                              ],


    ),


                ),
              //Expanded(
                /*child:*/Container(
                  width: MediaQuery.of(context).size.width ,
                  height: MediaQuery.of(context).size.height * 0.1,
                  color: Colors.white,
                  child:
                  Align(
                    alignment: Alignment.topRight,



                       child:Container(
                            width: 250,
                          color: Colors.white,

                          child:Row(
                        children:[DecoratedBox(
                          // chat bubble decoration
                          decoration: BoxDecoration(
                            color: Colors.lightGreen,
                            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
                          ),

                          child: Padding(
                              padding: const EdgeInsets.all(10),

                              child:Container(width: 170,
                                  height: MediaQuery.of(context).size.width * 0.07,
                                  color: Colors.lightGreen,

                                  child:Column(
                                      children:const [
                                        Padding(
                                          padding:  EdgeInsets.all(0),

                                          child: TextField(
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.all(0.0),
                                              isDense: true,
                                              border: InputBorder.none,
                                              hintText: 'Ecrire un commentaire'
                                            ),
                                            minLines: 1,
                                            maxLines: 1,
                                        ),),
                                      ]

                                  )

                              )
                            /*TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'User Name',

                                ),
                              ),*/
                          ),
                        ),
                          IconButton(icon: Icon(Icons.send_rounded),iconSize:MediaQuery.of(context).size.width * 0.05,
                            color: Colors.grey,
                            splashColor: Colors.black,
                            onPressed: () {},),
    ],),


                  ),

                  ),
                ),
   // ),

              /*Container(
                width: 100,
                height: MediaQuery.of(context).size.width * 0.05,
                color: Colors.white,
                child: Column(
                  children:[
                    IconButton(icon: Icon(Icons.send_rounded),iconSize:MediaQuery.of(context).size.width * 0.05,
                      color: Colors.grey,
                      splashColor: Colors.black,
                      onPressed: () {},),
                    Center(
                      child:DecoratedBox(
                           // chat bubble decoration
                           decoration: BoxDecoration(
                           color: Colors.lightGreen,
                           borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
                          ),

                          child: Padding(
                            padding: const EdgeInsets.all(10),

                            child:Container(width: 100,
                                height: MediaQuery.of(context).size.width * 0.05,
                                color: Colors.white,
                                child:Column(
                                    children:const [
                                      TextField(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'User Name',

                                        ),
                                      ),
                                    ]

                                )

                            )
                            /*TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'User Name',

                              ),
                            ),*/
                          ),
                     ),

                    ),
                  ],

                ),
              ),*/



  ],
    ),
    ),

    );
  }
}

