import 'package:artivity_front/screens/Connexion/Connexion.dart';
import 'package:artivity_front/screens/inscription/Inscription.dart';
import 'package:flutter/material.dart';
import 'package:artivity_front/screens/widgets/ReusableFilledButton.dart';
import '../../theme/constants.dart';
import '../../theme/style.dart';

class Ouverture extends StatelessWidget {
  const Ouverture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        padding: const EdgeInsets.fromLTRB(23, 138, 23, 0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Styles.accentColor),
        child: Column(
          children: [
            Text(
              sloganText.toUpperCase(),
              textAlign: TextAlign.center,
              style: Styles.sloganText,

            ),
            SizedBox(
              child: ReusableFilledButton(
                textStyle: Styles.accentButtonTextDark,
                text: inscriptionButtonText.toUpperCase(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Inscription()),
                  );
                },
                color: Colors.white,
                border: Styles.noBorder,
                margin: EdgeInsets.fromLTRB(60, 80, 60, 26),
              ),
              width: MediaQuery.of(context).size.width,
            ),
            SizedBox(
              child: ReusableFilledButton(
                textStyle: Styles.accentButtonTextDark,
                text: loginButtonText.toUpperCase(),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Connexion()),
                  );
                },
                color: Colors.white,
                border: Styles.noBorder,
                margin: EdgeInsets.fromLTRB(60, 0, 60, 0),
              ),
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(6, 58, 6, 0),
              child: Image.asset(
                'assets/images/Artivity1.png',
                width: MediaQuery.of(context).size.height*0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
