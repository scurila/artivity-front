import 'package:artivity_front/screens/presentation_defi/PresentationDefi.dart';
import 'package:artivity_front/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:artivity_front/screens/Communaute/Communaute.dart';

import '../../services/UserBackendService.dart';
import '../../services/objects/Challenge.dart';
import '../../theme/style.dart';
import '../accueil/Accueil.dart';
class LoggedInScreen extends StatefulWidget {
   LoggedInScreen({Key? key,
    required this.dailyChallenge,
  }) : super(key: key);
  final Challenge dailyChallenge;

  @override
  State<LoggedInScreen> createState() => _LoggedInScreenState();
}


/*loadDailyChallenge() async {
  try {
    await UserBackendService.loadDailyChallenge();
    print('loading daily challenge');
  } catch (e) {
    print(e);
  }
}*/

class _LoggedInScreenState extends State<LoggedInScreen> {

  //late Challenge dailyChallenge = loadDailyChallenge();


  late List<Widget> _pages = [
     Accueil(dailyChallenge: widget.dailyChallenge),
    //Accueil(dailyChallenge: Challenge(id: 0, title: "abcd", subject: "aa", type: "audio", start_time: 0, end_time: 10, timelimit: 9, user_created: ' ', rating: 3, answer_count: 2, typeForFront: "CHALLENGE_TYPE_AUDIO"), ),
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
