class ChallengeSubmission {
  String? b64data;
  int start_time;
  int user_id;
  String user_pseudo;

  ChallengeSubmission({
    this.b64data,
    required this.start_time,
    required this.user_id,
    required this.user_pseudo
  });

  factory ChallengeSubmission.fromJson(Map<String, dynamic> json) {
    return ChallengeSubmission(
      b64data: json['data'],
      start_time: json['start_time'],
      user_id: json["user"]["id"],
      user_pseudo: json['user']['pseudo'],
    );
  }
}