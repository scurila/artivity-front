import 'package:artivity_front/screens/Connexion/Connexion.dart';
import 'package:flutter/material.dart';

import '../../theme/constants.dart';
import '../../theme/style.dart';
import '../widgets/FormTextFieldRow.dart';
import '../widgets/Headbar.dart';
import '../widgets/ReturnButton.dart';
import '../widgets/ReusableFilledButton.dart';
import 'package:artivity_front/services/UserBackendService.dart';

class Inscription extends StatefulWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  bool CUIsSwitched = false;
  bool DataIsSwitched = false;
  final TextEditingController controllerLogin = TextEditingController();
  final TextEditingController controllerAge = TextEditingController();
  final TextEditingController controllerMail = TextEditingController();
  final TextEditingController controllerPwd = TextEditingController();


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
                text: inscriptionHeader,
                rightContainer: Container()
            ),

            Container(
              height: MediaQuery.of(context).size.height-86,
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container( // Boîte verte
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 24),
                        decoration: BoxDecoration(color: Styles.accentColorLight,borderRadius: const BorderRadius.all(Radius.circular(20)),),
                        child: Column(
                          children: [
                            // Champs de texte avec labels
                            FormTextFieldRow(text: inscriptionPseudo, obscured: false, controller: controllerLogin),
                            const SizedBox(height: 20),
                            FormTextFieldRow(text: inscriptionAge, obscured: false, controller: controllerAge),
                            const SizedBox(height: 20),
                            FormTextFieldRow(text: inscriptionMail, obscured: false, controller: controllerMail),
                            const SizedBox(height: 20),
                            FormTextFieldRow(text: inscriptionMdp, obscured: true, controller: controllerPwd),
                            const SizedBox(height: 20),

                            // Bouton inscription
                            SizedBox(
                              child: ReusableFilledButton(
                                textStyle: Styles.accentButtonText,
                                text: inscriptionButtonText.toUpperCase(),
                                onPressed: () async {
                                  try {
                                    //await UserBackendService.zerazer(controllerLogin.text, controllerAge.text, controllerMail.text, controllerPwd.text);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Connexion()),
                                    );
                                  } catch (e) {
                                    print(e);
                                    //showAlertDialog(context);
                                  }
                                },
                                color: Styles.accentColor,
                                border: Styles.noBorder,
                                margin: const EdgeInsets.fromLTRB(60, 0, 60, 0),
                              ),
                              width: MediaQuery.of(context).size.width,
                            ),
                            const SizedBox(height: 20),

                            // Checkboxes
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Switch(
                                  value: CUIsSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      CUIsSwitched = value;
                                      print(CUIsSwitched);
                                    });
                                  },
                                  activeTrackColor: Styles.accentColorLight,
                                  activeColor: Colors.green,
                                ),
                                const Flexible(child: Text(inscriptionCU),),
                              ],
                            ),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Switch(
                                  value: DataIsSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      DataIsSwitched = value;
                                      print(DataIsSwitched);
                                    });
                                  },
                                  activeTrackColor: Styles.accentColorLight,
                                  activeColor: Colors.green,
                                ),
                                const Flexible(child: Text(inscriptionData),),
                              ],
                            ),
                            const SizedBox(height: 20),

                            InkWell(child: Text(inscriptionDejaInscrit.toUpperCase(), style: Styles.pasInscritText), onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Connexion()),
                              );
                            },),
                          ],
                        ),
                      ),

                      Container(
                        padding: const EdgeInsets.fromLTRB(6, 6, 6, 0),
                        child: Image.asset(
                          'assets/images/Artivity.png',
                          width: MediaQuery.of(context).size.width*3/10,
                          height: MediaQuery.of(context).size.height*2/10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}
