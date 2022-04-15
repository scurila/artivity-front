import 'package:flutter/material.dart';

import '../../theme/constants.dart';
import '../../theme/style.dart';
import '../widgets/FormTextFieldRow.dart';
import '../widgets/Headbar.dart';
import '../widgets/ReturnButton.dart';
import '../widgets/ReusableFilledButton.dart';

class Inscription extends StatelessWidget {
  const Inscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,

      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        decoration: const BoxDecoration(color: Colors.white),

        child: ListView(
            children: [
              Column(
                children: [


                  Container( // Boîte verte
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 24),
                    decoration: BoxDecoration(color: Styles.accentColorLight,borderRadius: const BorderRadius.all(const Radius.circular(20)),),
                    child: Column(
                      children: [
                        // Champs de texte avec labels
                        const FormTextFieldRow(text: inscriptionPseudo),
                        const SizedBox(height: 20),
                        const FormTextFieldRow(text: inscriptionAge),
                        const SizedBox(height: 20),
                        const FormTextFieldRow(text: inscriptionMail),
                        const SizedBox(height: 20),
                        const FormTextFieldRow(text: inscriptionMdp),
                        const SizedBox(height: 20),

                        // Bouton inscription
                        SizedBox(
                          child: ReusableFilledButton(
                            textStyle: Styles.accentButtonText,
                            text: inscriptionButtonText.toUpperCase(),
                            onPressed: () {},
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
                            Checkbox(value: false, onChanged: (bool? value) {}, ),
                            Flexible(child: Text(inscriptionCU),),
                          ],
                        ),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Checkbox(value: false, onChanged: (bool? value) {}, ),
                            const Text(inscriptionData, softWrap: true,),
                          ],
                        ),
                        const SizedBox(height: 20),

                        Text(inscriptionDejaInscrit.toUpperCase(), style: Styles.pasInscritText),
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
            ],
        ),

      ),
    );
  }
}
