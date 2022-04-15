import 'dart:convert';

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
}