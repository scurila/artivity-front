import 'dart:io';
import 'dart:typed_data';

import 'package:artivity_front/screens/widgets/ImagePopup.dart';
import 'package:artivity_front/screens/widgets/ReusableCard.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../../../services/AudioPlayerService.dart';
import '../../../theme/constants.dart';
import '../../../theme/style.dart';
import '../../widgets/Popup.dart';

class CreationParticipantsCard extends StatelessWidget {
  CreationParticipantsCard({Key? key, required this.isDone ,required this.author, required this.date, this.imgUrl, this.imgFile, required this.data, required this.type}) : super(key: key);
  bool isDone;
  String author;
  String date;
  String? imgUrl;
  Uint8List? imgFile;
  Uint8List? data;
  String type;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (data != null) {
          // todo : handle differently based on type !
          if (type == CHALLENGE_TYPE_PHOTO || type == CHALLENGE_TYPE_DESSIN) {
            showDialog(
              context: context,
              builder: (BuildContext context) => ImagePopup(imgData: data!, pseudo: author),
            );
          }
          if (type == CHALLENGE_TYPE_AUDIO && data != null) {
            print('PLAYING');
            String dir = (await getTemporaryDirectory()).path;
            File temp = File('$dir/temp.mp4');
            temp.writeAsBytesSync(data!);

            AudioPlayerService aps = AudioPlayerService();
            final duration = aps.setPath(filePath: '$dir/temp.mp4');
            await aps.play();
            temp.delete();
          }
          if (type == CHALLENGE_TYPE_LITTERAIRE) {
            // todo txtpopup
          }
        }
      },
      child: Container(
        margin: const EdgeInsets.only(top: 2, bottom: 2, left: 2, right: 2),
        width: MediaQuery.of(context).size.width/2 - 14,
        child: ReusableCard(
          borderRadius: 9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 160,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    (imgFile != null?
                      Image.memory(imgFile!, height: (isDone ? 130 : 130),)
                      :
                      Image.asset((isDone ? imgUrl! : "assets/images/sand-clock.png"), height: (isDone ? 130 : 130),)
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5,),
              Container(height: 40, child: Text( (isDone ? creationOfDefi : waitingCreationOf) + author, style: Styles.challengeInvitedBy,)),
              const SizedBox(height: 5),
              Text("Le "+date)
            ],
          ),
        ),
      ),
    );
  }
}
