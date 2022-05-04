import 'package:flutter/material.dart';
import 'package:artivity_front/screens/widgets/Headbar.dart';
import 'package:artivity_front/screens/widgets/ReusableFilledButton.dart';
import '../../theme/constants.dart';
import '../../theme/style.dart';

class MonProfil extends StatelessWidget {
  const MonProfil({Key? key, required this.name,  required this.age,  required this.mail,  required this.date,  required this.nbDefi,  required this.continuousDays}) : super(key: key);
  final String name;
  final int age;
  final String mail;
  final String date;
  final int nbDefi;
  final int continuousDays;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width,
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
                    children: [
                    // ----- App bar -----
                          Headbar(
                            leftContainer: Image.asset('assets/images/ARTHUR.png', width:70),
                            text: name,
                            rightContainer: Image.asset('assets/images/note.png', width:48)),

                          Container(
                              height: MediaQuery.of(context).size.height - 123 - 40-21,
                              child: Scrollbar(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      const SizedBox(height: 20),
                                      // ----- My data -----
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(50, 6, 0, 16),
                                        width: MediaQuery.of(context).size.width,
                                        child:  Text( "Âge :   " + age.toString(),textAlign: TextAlign.left,style: Styles.profileData),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(50, 2, 0, 16),
                                        width: MediaQuery.of(context).size.width,
                                        child:  Text( "Adresse mail :   "+mail,textAlign: TextAlign.left,style: Styles.profileData),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(50, 2, 0, 16),
                                        width: MediaQuery.of(context).size.width,
                                        child:  Text( "Membre depuis :   "+date,textAlign: TextAlign.left,style: Styles.profileData),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(50, 2, 0, 16),
                                        width: MediaQuery.of(context).size.width,
                                        child:  Text( "Nombre de défis relevés :   "+nbDefi.toString(),textAlign: TextAlign.left,style: Styles.profileData),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.fromLTRB(50, 2, 0, 16),
                                        width: MediaQuery.of(context).size.width,
                                        child:  Text( "Jours en continus :   "+continuousDays.toString(),textAlign: TextAlign.left,style: Styles.profileData),
                                      ),
                                      const SizedBox(height: 20),
                                      // ----- Boutons -----
                                      SizedBox(
                                        child: ReusableFilledButton(
                                          textStyle: Styles.accentButtonText,
                                          text: modifButtonText.toUpperCase(),
                                          onPressed: () {},
                                          color: Styles.accentColor,
                                          border: Styles.noBorder,
                                          margin: const EdgeInsets.fromLTRB(90, 0, 90, 0),
                                        ),
                                        width: MediaQuery.of(context).size.width,
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        child: ReusableFilledButton(
                                          textStyle: Styles.accentButtonText,
                                          text: consulterAmisText.toUpperCase(),
                                          onPressed: () {},
                                          color: Styles.accentColor,
                                          border: Styles.noBorder,
                                          margin: const EdgeInsets.fromLTRB(90, 0, 90, 0),
                                        ),
                                        width: MediaQuery.of(context).size.width,
                                      ),
                                      const SizedBox(height: 10),
                                      SizedBox(
                                        child: ReusableFilledButton(
                                          textStyle: Styles.accentButtonText,
                                          text: consulterGalerieText.toUpperCase(),
                                          onPressed: () {},
                                          color: Styles.accentColor,
                                          border: Styles.noBorder,
                                          margin: const EdgeInsets.fromLTRB(90, 0, 90, 0),
                                        ),
                                        width: MediaQuery.of(context).size.width,
                                      ),
                                      const SizedBox(height: 40),
                                      SizedBox(
                                        child: ReusableFilledButton(
                                          textStyle: Styles.accentButtonText,
                                          text: consulterDeconnecterText.toUpperCase(),
                                          onPressed: () {},
                                          color: Styles.accentColor,
                                          border: Styles.noBorder,
                                          margin: const EdgeInsets.fromLTRB(90, 0, 90, 0),
                                        ),
                                        width: MediaQuery.of(context).size.width,
                                      ),
                                      const SizedBox(height: 60),
                                      SizedBox(
                                        child: ReusableFilledButton(
                                          textStyle: Styles.accentButtonText,
                                          text: deleteAccountText.toUpperCase(),
                                          onPressed: () {},
                                          color: Styles.redColorLight,
                                          border: Styles.noBorder,
                                          margin: const EdgeInsets.fromLTRB(90, 0, 90, 0),
                                        ),
                                        width: MediaQuery.of(context).size.width,
                                      ),
                                      const SizedBox(height: 40),
                                        ]
                                      ),
                                    ),
                                  ),
                          ),
                    ]
                  ),
              ),
    );
  }
}
