

import '../../theme/constants.dart';

class  User {
  final int id;
  final String pseudo;
  final String? bio;

  const User({
    required this.id,
    required this.pseudo,
    this.bio
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      pseudo: json['pseudo'],
      bio: json["bio"],
    );
  }
}





