import 'package:artivity_front/screens/inscription/Inscription.dart';
import 'package:artivity_front/screens/widgets/FormTextFieldRow.dart';
import 'package:artivity_front/screens/widgets/Headbar.dart';
import 'package:artivity_front/screens/widgets/ReturnButton.dart';
import 'package:artivity_front/services/UserBackendService.dart';
import 'package:artivity_front/theme/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/style.dart';
import '../loggedInScreen/LoggedInScreen.dart';
import '../widgets/ReusableFilledButton.dart';

class Connexion extends StatelessWidget {
  const Connexion({Key? key}) : super(key: key);

  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
         Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Échec"),
      content: Text("Données de correction invalides."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Headbar(
                  leftContainer: ReturnButton(),
                  text: connexionHeadbarText,
                  rightContainer: Container(width: 48,)),
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
                        onPressed: () async {
                          try {
                            await UserBackendService.login("dany", "toto");
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LoggedInScreen()), // temporaire stp procure API
                            );
                          } catch (_) {
                            showAlertDialog(context);
                          }
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

