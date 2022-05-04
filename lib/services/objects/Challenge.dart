

import '../../theme/constants.dart';

class Challenge {
  final int id;
  final String title;
  final String subject;
  final String type;
  String typeForFront;
  final int start_time;
  final int? end_time;
  final int? timelimit;
  final int? leftTime;
  //final String user_created;
  final int rating;
  final int answer_count;

  Challenge({
    required this.id,
    required this.title,
    required this.subject,
    required this.type,
    required this.start_time,
    this.end_time = 0,
    this.timelimit = 4294967296,
    //required this.user_created,
    this.rating = 0,
    required this.answer_count,
    this.typeForFront=" ",
    this.leftTime,
  }){typeForFront=associateType();}

  factory Challenge.fromJson(Map<String, dynamic> json) {
    return Challenge(
      id: json['challenge']['id'],
      title: json['challenge']['title'],
      subject: json['challenge']['subject'],
      type: json['challenge']['type'],
      start_time: json['challenge']['start'],
      end_time: json ['challenge']['end'] != null ? (json['end_time'] as num?)?.toInt() : null,
      timelimit: json ['challenge']['timelimit'] != null ? (json['timelimit'] as num?)?.toInt() : null,
      //user_created: json['challenge']['user_created'],
      rating: json ['challenge']['rating'],
      answer_count: json ['challenge']['answer_count'],
      leftTime: json['challenge']['time_remaining'],
    );
  }

  associateType(){
    switch(this.type){
      case "video":
        return CHALLENGE_TYPE_VIDEO;
      case "text":
        return CHALLENGE_TYPE_LITTERAIRE;
      case "drawing":
        return CHALLENGE_TYPE_DESSIN;
      case "sound":
        return CHALLENGE_TYPE_AUDIO;
      case "photo":
        return CHALLENGE_TYPE_PHOTO;
      default:
        return "ERROR";
    }
  }


}





