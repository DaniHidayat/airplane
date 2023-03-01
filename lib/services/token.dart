import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class Token {
  static String token = '';

  static Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('token') == null) {
      token = '';
    } else {
      token = sharedPreferences.getString('token')!;
    }
    return token;
  }

  static Future<Map<String, String>> header() async {
    String tok = await Token.getToken();
    var header = {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader: 'Bearer ' + tok
    };
    return header;
  }
}
