import 'package:artivity_front/screens/widgets/ReusableRoundButton.dart';
import 'package:artivity_front/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/style.dart';
import '../widgets/EditBarDefi.dart';
import '../widgets/Headbar.dart';

class DefiPhoto extends StatelessWidget {
  const DefiPhoto({
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
                Headbar(leftContainer: Image.asset('assets/images/ARTHUR.png', width: 48,), text: defiPhotoText, rightContainer: Container()),

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

                SizedBox(height: MediaQuery.of(context).size.height*0.1),

                ReusableRoundButton(size: 100, image: Icon(Icons.photo_camera, size: 50), onPressed: (){}, color: Styles.accentColor, border: Styles.noBorder),
                SizedBox(height: MediaQuery.of(context).size.height*0.075),
                ReusableRoundButton(size: 100, image: Icon(Icons.play_arrow, size: 50), onPressed: (){}, color: Styles.accentColor, border: Styles.noBorder),
                SizedBox(height: MediaQuery.of(context).size.height*0.075),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ReusableRoundButton(size: 80, image: Icon(Icons.download, size: 30), onPressed: (){}, color: Styles.accentColor, border: Styles.noBorder),
                    ReusableRoundButton(size: 80, image: Icon(Icons.upload_file, size: 30), onPressed: (){}, color: Styles.accentColor, border: Styles.noBorder),
                    ReusableRoundButton(size: 80, image: Icon(Icons.send, size: 30), onPressed: (){}, color: Styles.accentColor, border: Styles.noBorder),
                  ],
                ),

              ]
          ),
        )
    );
  }
}