import 'dart:convert';

import 'package:artivity_front/services/objects/Challenge.dart';
import 'package:artivity_front/services/objects/ContentAccueil.dart';
import 'package:artivity_front/theme/constants.dart';
import 'package:http/http.dart' as http;


class UserBackendService {
  static String currentToken = "";

  static Future<String> login(String pseudo, String pwd) async {
    http.Response resp = await http.post(
      Uri.parse(backendServerBase + '/users/auth/login'),
      headers: <String, String>{
        'Content-Type': "application/json; charset=UTF-8",
      },
      body: jsonEncode(<String, String>{
        'username': pseudo,
        'password': pwd,
      })
    );

    if (resp.statusCode == 200) {
      var responseJson = json.decode(resp.body.toString());
      currentToken = responseJson['token'];
      return currentToken;
    } else {
      throw Exception('LoginError');
    }
  }

  static Future<ContentAccueil> loadContentAccueil() async {

        ContentAccueil content;
        Challenge c;
        final response = await http.get(Uri.parse(backendServerBase + '/challenge/daily'),
          headers: <String, String>{
            'Authorization': "Bearer "+currentToken,
          },);
        print('fonction appelee');
        if (response.statusCode == 200) {
          print(response.body);
          c = Challenge.fromJson(jsonDecode(response.body));
        } else {
          throw Exception('LoadingDailyChallengeError');
        }
        content= ContentAccueil(dailyChallenge: c);
        return content;

  }


}