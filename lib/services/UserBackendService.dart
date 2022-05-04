import 'dart:convert';
import 'dart:io';

import 'package:artivity_front/services/objects/Challenge.dart';
import 'package:artivity_front/services/objects/ContentAccueil.dart';
import 'package:artivity_front/theme/constants.dart';
import 'package:http/http.dart' as http;


class UserBackendService {
  static String currentToken = "";
  static String currentPseudo="";

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

    print(resp.statusCode);
    if (resp.statusCode == 200) {
      var responseJson = json.decode(resp.body.toString());
      currentToken = responseJson['token'];
      currentPseudo = pseudo;
      return currentToken;
    } else {
      throw Exception('LoginError');
    }
  }

  static Future<String> signup(String pseudo, String email, String pwd) async {
    http.Response resp = await http.post(
        Uri.parse(backendServerBase + '/users/'),
        headers: <String, String>{
          'Content-Type': "application/json; charset=UTF-8",
          'Connection': "close",
        },
        body: jsonEncode(<String, String>{
          'pseudo': pseudo,
          'password': pwd,
          'email': email,
        })
    );
    print(resp.statusCode);
    if (resp.statusCode == 200) {
      return 'inscription réussie';

    } else {
      throw Exception('LoginError');

    }
  }


  static Future<ContentAccueil> loadContentAccueil() async {

        ContentAccueil content;
        Challenge c;
        List<Challenge> invitations = <Challenge>[];

        // LOAD DAILY CHALLENGE
        final responseDailyChallenge = await http.get(Uri.parse(backendServerBase + '/challenge/daily'),
          headers: <String, String>{
            'Authorization': "Bearer "+currentToken,
          },);
        if (responseDailyChallenge.statusCode == 200) {
          print(responseDailyChallenge.body);
          c = Challenge.fromJson(jsonDecode(responseDailyChallenge.body));
        } else {
          throw Exception('LoadingDailyChallengeError');
        }

        // LOAD INVITATIONS
        final responseInvitations = await http.get(Uri.parse(backendServerBase+"/users/challenges/invites/received"),
          headers: <String, String>{
          'Authorization': "Bearer "+currentToken,
        },);
        print(currentToken);
        if (responseInvitations.statusCode == 200) {
          print(responseInvitations.body);

          var list = jsonDecode(responseInvitations.body)['invites'] as List;

          int nbInvitations = jsonDecode(responseInvitations.body)['count'];
          for(int i=0; i<nbInvitations; i++){
            Challenge invit = Challenge.fromJson(list.elementAt(i));
            invitations.add(invit);
          }
          // TODO
        } else {
          throw Exception('LoadingInvitationsError');
        }

        content = ContentAccueil(dailyChallenge: c, invitations: invitations);
        return content;

  }

  static Future<Challenge> loadChallenge(int id) async {
    Challenge c;

    final response = await http.get(Uri.parse(backendServerBase + '/challenge/' + id.toString()),
    headers: <String, String>{
      'Authorization': "Bearer "+currentToken,
    },);

    if (response.statusCode == 200) {
      print(response.body);
      c = Challenge.fromJson(jsonDecode(response.body));
      return c;
    } else {
      throw Exception('LoadingChallengeError');
    }
  }

  static void startChallenge(int id) async {
    final response = await http.post(Uri.parse(backendServerBase + '/challenge/' + id.toString() + '/start'),
      headers: <String, String>{
        'Authorization': "Bearer "+currentToken,
      },);

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
      throw Exception('LoadingChallengeError');
    }
  }

  static Future<void> submitChallenge(String b64data, int chalId) async {
    final response = await http.post(Uri.parse(backendServerBase + '/challenge/' + chalId.toString() + '/submit'),
      headers: <String, String>{
        'Authorization': "Bearer "+currentToken,
        'Content-Type': "application/json; charset=UTF-8",
      },
      body: jsonEncode(<String, String>{
        'data': b64data,
      }));

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.statusCode);
      throw Exception('SubmitChallengeError');
    }
  }

}