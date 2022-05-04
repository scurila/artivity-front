import 'package:artivity_front/screens/defiAudio/DefiAudio.dart';
import 'package:artivity_front/screens/defiPhoto/DefiPhoto.dart';
import 'package:artivity_front/screens/defiVideo/DefiVideo.dart';
import 'package:artivity_front/screens/defiLitteraire/DefiLitteraire.dart';
import 'package:artivity_front/screens/widgets/Headbar.dart';
import 'package:artivity_front/screens/presentation_defi/widgets/Defi.dart';
import 'package:artivity_front/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:artivity_front/screens/galerie/widgets/Artwork.dart';


import '../../services/objects/Challenge.dart';
import '../../theme/style.dart';
import '../defiDessin/DefiDessin.dart';
import '../widgets/ReusableFilledButton.dart';

class Galerie extends StatelessWidget {
  const Galerie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        width: MediaQuery.of(context).size.width - 5,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        decoration: const BoxDecoration(color: Colors.white),

        child: Column(
            children: [

              // ----- App bar -----
              Headbar(
                  leftContainer: const BackButton(),
                  text: "Ma galerie",
                  rightContainer: Image.asset('assets/images/search.png', width:48) ),
              Container(
                height: MediaQuery.of(context).size.height - 123 - 50,
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                            width: MediaQuery.of(context).size.width,
                            child: Column( // cards
                              children: [
                                Row(
                                  children: [
                                    Artwork(author: "Jean C.", date: "14/02/2022", imgUrl: "assets/images/creation_placeholder.png",),
                                    Artwork( author: "Jean C.", date: "14/02/2022", imgUrl: "assets/images/creation_placeholder.png",),

                                  ],
                                ),
                                Row(
                                  children: [

                                    Artwork(author: "Jean C.", date: "14/02/2022", imgUrl: "assets/images/creation_placeholder.png",),
                                    Artwork( author: "Jean C.", date: "14/02/2022", imgUrl: "assets/images/creation_placeholder.png",),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Artwork(author: "Jean C.", date: "14/02/2022", imgUrl: "assets/images/creation_placeholder.png",),
                                    Artwork(author: "Jean C.", date: "14/02/2022", imgUrl: "assets/images/creation_placeholder.png",),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Artwork(author: "Jean C.", date: "14/02/2022", imgUrl: "assets/images/creation_placeholder.png",),

                                  ],
                                )
                              ],
                            ),
                          )
                        ]
                    ),
                  ),
                ),
              ),]

        ),
      ),
    );
  }
}
