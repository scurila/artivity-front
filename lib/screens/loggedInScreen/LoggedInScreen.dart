import 'package:artivity_front/screens/presentation_defi/PresentationDefi.dart';
import 'package:artivity_front/screens/resultat_defi/ResultatDefi.dart';
import 'package:artivity_front/services/UserBackendService.dart';
import 'package:artivity_front/services/objects/ContentAccueil.dart';
import 'package:artivity_front/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:artivity_front/screens/Communaute/Communaute.dart';
import 'package:artivity_front/screens/mon_profil/MonProfil.dart';
import 'package:artivity_front/screens/galerie/Galerie.dart';

import '../../theme/style.dart';
import '../accueil/Accueil.dart';
class LoggedInScreen extends StatefulWidget {
   const LoggedInScreen({Key? key,
     required this.contentAccueil
  }) : super(key: key);
  final ContentAccueil contentAccueil;

  @override
  State<LoggedInScreen> createState() => _LoggedInScreenState();
}


class _LoggedInScreenState extends State<LoggedInScreen> {

  late List<Widget> _pages = [
    Accueil(dailyChallenge: widget.contentAccueil.dailyChallenge, invitations: widget.contentAccueil.invitations),
    Communaute(),
    Galerie(),
    /*ResultatDefi(type: "dessin", author: "William J.", date: "23/06/2022",
      description: "Dessine moi un mouton dans un champs, faisant un poirier su run trampoline en tenant un verre de schnaps.",
      eval: 2, artistsCount: "122345",),*/
    MonProfil(name: UserBackendService.currentPseudo, age:UserBackendService.currentAge, mail: UserBackendService.currentEmail, date:"06/05/2022", nbDefi:4, continuousDays: 1),
    //PresentationDefi(type: CHALLENGE_TYPE_DESSIN),
    //PresentationDefi(type: CHALLENGE_TYPE_PHOTO),
    //PresentationDefi(type: CHALLENGE_TYPE_VIDEO),
    //PresentationDefi(type: CHALLENGE_TYPE_AUDIO), // todo
  ];

  int _selectedIndex = 0;





  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Styles.greyedNavbarButton,
          selectedItemColor: Styles.accentColor,
          showUnselectedLabels: false,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: 'Accueil',
              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.people_outline),
                label: 'Communauté'
            ),
            /*BottomNavigationBarItem(
              icon: Icon(Icons.edit_outlined),
              label: 'Défis',
              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            ),*/
            BottomNavigationBarItem(
              icon: Icon(Icons.image_outlined),
              label: 'Créations',
              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: 'Profil',
              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,

        ),
        body: AnimatedContainer(child: _pages.elementAt(_selectedIndex), duration: const Duration(milliseconds: 500),),
      ),
    );
  }
}
