import 'package:artivity_front/screens/widgets/Headbar.dart';
import 'package:artivity_front/screens/widgets/ReturnButton.dart';
import 'package:artivity_front/screens/presentation_defi/widgets/Defi.dart';
import 'package:artivity_front/theme/constants.dart';
import 'package:flutter/material.dart';

import '../../theme/style.dart';
import '../widgets/ReusableFilledButton.dart';

class PresentationDefi extends StatelessWidget {
  const PresentationDefi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(
          width: MediaQuery.of(context).size.width - 5,
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [

              // ----- App bar -----
              Container(
                padding: const EdgeInsets.fromLTRB(12, 5, 12, 0),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/ARTHUR.png', width: 48,),
                    Text("William Shakespeare", style: Styles.pageTitleText,),
                    IconButton(onPressed: () {

                    }, icon: const Icon(Icons.draw_outlined))
                  ],
                ),
              ),
              SizedBox(height: 30),

              // ----- Type défi + infos -----
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(color: Styles.accentColor,borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    Defi(challengeType: CHALLENGE_TYPE_ECRITURE, invitedBy: "Chris D.", executionTime: "2", leftTime: "2h", eval: 2, artists: "122345",),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // ----- Commentaires -----
              Container(
                padding: EdgeInsets.only(left: 20.0),
                width: MediaQuery.of(context).size.width,
                  child: Text("Commentaires artiste",textAlign: TextAlign.left ,style: Styles.challengeDescription)
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width - 5,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(color: Styles.greyedOutColor,borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    Image.asset('assets/images/ARTHUR.png', width: 48,),
                    Text("Text commentaire",textAlign: TextAlign.left ,style: Styles.challengeDescription),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // ----- Description ------
              Container(
                  padding: EdgeInsets.only(left: 20.0),
                  width: MediaQuery.of(context).size.width,
                  child: Text("Description",textAlign: TextAlign.left ,style: Styles.challengeDescription)
              ),
              SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width - 5,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                decoration: BoxDecoration(color: Styles.greyedOutColor,borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width - 15,
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                          children: [
                            Text("Jean V. " + Defi.descriptionDefiInvitation + "poésie collaborative"
                            + Defi.descriptionDefiCollaboratifJoin +"(Alexandre R., Maria T., Kevin B.)"
                            + Defi.descriptionDefiCollaboratifCompose + " une poésie unique et créative sur « musique, sons, sonorités »." + "\n"
                            + Defi.descriptionDefiTexteCollaboratif),
                          ],
                        ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),

              // ----- Bouton commencer défi -----
              SizedBox(
                child: ReusableFilledButton(
                  textStyle: Styles.accentButtonText,
                  text: presentationDefiCommencer.toUpperCase(),
                  onPressed: () {},
                  color: Styles.accentColor,
                  border: Styles.noBorder,
                  margin: EdgeInsets.fromLTRB(60, 0, 60, 0),
                ),
                width: MediaQuery.of(context).size.width,
              ),
            ],
          ),
        ));
  }
}

