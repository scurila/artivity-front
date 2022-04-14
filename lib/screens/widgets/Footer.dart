import 'package:flutter/material.dart';

import '../../theme/style.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
          icon: Icon(Icons.browse_gallery_outlined),
          label: 'Créations',
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined),
          label: 'Profil',
          backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        ),
      ],

    );
  }
}
