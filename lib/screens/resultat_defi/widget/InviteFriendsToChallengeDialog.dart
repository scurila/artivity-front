
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../services/UserBackendService.dart';
import '../../../services/objects/Challenge.dart';
import '../../../services/objects/User.dart';
import '../../../theme/style.dart';

class InviteFriendsToChallengeDialog extends StatefulWidget {
  final List<User> friends;
  final int challengeId;

  const InviteFriendsToChallengeDialog({
    Key? key,
    required this.friends,
    required this.challengeId
  }): super(key: key);

  @override
  State<InviteFriendsToChallengeDialog> createState() => _InviteFriendsToChallengeDialogState();
}

class _InviteFriendsToChallengeDialogState extends State<InviteFriendsToChallengeDialog> {

  List<bool> checkedFriends = [];
  List<User> friends = [];
  int challengeId = 0;

  sendInvites() {
    for(var i = 0; i < checkedFriends.length; i++) {
      if(checkedFriends[i]) {
        try {
          UserBackendService.inviteToChallenge(friends[i].id, challengeId);
        }
        catch(e) {
          Fluttertoast.showToast(
            msg: 'Une erreur est survenue lors de l\'envoi d\'une invitation !',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Styles.accentColor,
            textColor: Colors.black,
          );
        }
        print("Send invite to " + friends[i].pseudo + " for challenge with id " + challengeId.toString());
      }
    }

    Navigator.of(context).pop();
    Fluttertoast.showToast(
      msg: 'Invitations envoyées !',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Styles.accentColor,
      textColor: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    friends = widget.friends;
    challengeId = widget.challengeId;

    List<Widget> friendEntries = [];
    for(var i = 0; i < friends.length; i++) {
      checkedFriends.add(false);
      friendEntries.add( //FriendCheckbox(user: friends[i])
        CheckboxListTile(
          title: Text(friends[i].pseudo),
          value: checkedFriends[i],
          onChanged: (bool? value) {
            setState(() {
              checkedFriends[i] = !checkedFriends[i];
            });
          },
          secondary: Image.asset("assets/images/ARTHUR.png", width: 45),
        ),
      );
    }

    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        child:
        Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child:
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Annuler"),
                      )
                  ),
                  const Expanded(
                    flex: 10,
                    child: Align(
                      child: Text(
                        "Inviter des amis", style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      alignment: Alignment.center
                    )
                  ),
                  Expanded(
                    flex: 5,
                    child:
                      TextButton(
                        onPressed: sendInvites,
                        child: const Text("Envoyer"),
                      )
                  ),
                ],
              ),
              Column(
                children: friendEntries,
              )
            ]
          )
      ),
    );
  }
}
