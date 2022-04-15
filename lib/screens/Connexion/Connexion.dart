import 'package:artivity_front/screens/inscription/Inscription.dart';
import 'package:artivity_front/screens/widgets/FormTextFieldRow.dart';
import 'package:artivity_front/screens/widgets/Headbar.dart';
import 'package:artivity_front/screens/widgets/ReturnButton.dart';
import 'package:artivity_front/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/style.dart';
import '../accueil/Accueil.dart';
import '../loggedInScreen/LoggedInScreen.dart';
import '../widgets/ReusableFilledButton.dart';

class Connexion extends StatelessWidget {
  const Connexion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(

          //padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Headbar(
                  leftContainer: ReturnButton(),
                  text: connexionHeadbarText,
                  rightContainer: Container()),
                  //rightContainer: Container(), expanding: true, onPressed: (){}),//test headbar
              Container(
               //width: MediaQuery.of(context).size.width-50,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
                decoration: BoxDecoration(color: Styles.accentColorLight,borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    FormTextFieldRow(text: inscriptionPseudo, obscured: false,),
                    SizedBox(height: 20),
                    FormTextFieldRow(text: inscriptionMdp, obscured: true,),
                    SizedBox(height: 40),
                    SizedBox(
                      child: ReusableFilledButton(
                        textStyle: Styles.accentButtonText,
                        text: connexionButtonText.toUpperCase(),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const LoggedInScreen()), // temporaire stp procure API
                          );
                        },
                        color: Styles.accentColor,
                        border: Styles.noBorder,
                        margin: EdgeInsets.fromLTRB(60, 0, 60, 0),
                      ),
                      width: MediaQuery.of(context).size.width,
                    ),
                    SizedBox(height: 20),
                    InkWell(child: Text(connexionPasInscritText.toUpperCase(),style: Styles.pasInscritText), onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Inscription()),
                      );
                    },),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(6, 58, 6, 0),
                child: Image.asset(
                  'assets/images/Artivity.png',
                  width: 150,
                  height: 150,
                ),
              ),
            ],
          ),
        ));
  }
}

