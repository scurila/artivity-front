import 'package:artivity_front/screens/consulter_amis/widgets/MyStatefulWidget.dart';
import 'package:flutter/material.dart';
import '../../../theme/style.dart';

class Friend extends StatelessWidget {
  Friend({Key? key, required this.name, required this.imgUrl}) : super(key: key);
  String name;
  String imgUrl;
  bool valuefirst = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.grey;
      }
      return Colors.red;
    }
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.fromLTRB(2,5, 5, 2),
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
      decoration: BoxDecoration(color: Styles.accentColorLight,borderRadius: const BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        children:
            [
          Row(
            children: [
              Container(
                child: Image.asset(imgUrl, width: 60,),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                width: MediaQuery.of(context).size.width - 15 - 75 -40,
                child: Text(name,textAlign: TextAlign.left ,style: Styles.nameText),
              ),
              // Checkbox
             const MyStatefulWidget()
            ],
          ),
    ]
    ),
    );
  }
}
