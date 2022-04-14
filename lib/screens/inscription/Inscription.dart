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

        child: Column(
          children: [
            Headbar(
                leftContainer: Container(child: ReturnButton(onPressed: () {})),
                text: inscriptionHeader,
                rightContainer: Container()
            ),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 24),
              decoration: BoxDecoration(color: Styles.accentColorLight,borderRadius: BorderRadius.all(Radius.circular(20)),),
              child: Column(
                children: [
                  FormTextFieldRow(text: inscriptionPseudo),
                  SizedBox(height: 20),
                  FormTextFieldRow(text: inscriptionAge),
                  SizedBox(height: 20),
                  FormTextFieldRow(text: inscriptionMail),
                  SizedBox(height: 20),
                  FormTextFieldRow(text: inscriptionMdp),
                  SizedBox(height: 20),
                  SizedBox(
                    child: ReusableFilledButton(
                      textStyle: Styles.accentButtonText,
                      text: inscriptionButtonText.toUpperCase(),
                      onPressed: () {},
                      color: Styles.accentColor,
                      border: Styles.noBorder,
                      margin: EdgeInsets.fromLTRB(60, 0, 60, 0),
                    ),
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(height: 20),
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
      ),

    );
  }
}
