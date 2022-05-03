import 'package:artivity_front/screens/presentation_defi/PresentationDefi.dart';
import 'package:artivity_front/services/objects/ContentAccueil.dart';
import 'package:artivity_front/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:artivity_front/screens/Communaute/Communaute.dart';

import '../../services/objects/Challenge.dart';
import '../../theme/style.dart';
import '../accueil/Accueil.dart';
class LoggedInScreen extends StatefulWidget {
   LoggedInScreen({Key? key,
     required this.contentAccueil
  }) : super(key: key);
  final ContentAccueil contentAccueil;

  @override
  State<LoggedInScreen> createState() => _LoggedInScreenState();
}


class _LoggedInScreenState extends State<LoggedInScreen> {

  late List<Widget> _pages = [
    Accueil(dailyChallenge: widget.contentAccueil.dailyChallenge),
    Communaute(),
    PresentationDefi(type: CHALLENGE_TYPE_ECRITURE),
    PresentationDefi(type: CHALLENGE_TYPE_DESSIN),
    PresentationDefi(type: CHALLENGE_TYPE_PHOTO),
    PresentationDefi(type: CHALLENGE_TYPE_VIDEO),
    PresentationDefi(type: CHALLENGE_TYPE_AUDIO), // todo
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
            BottomNavigationBarItem(
              icon: Icon(Icons.edit_outlined),
              label: 'Défis',
              backgroundColor: Color.fromRGBO(255, 255, 255, 1),
            ),
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
