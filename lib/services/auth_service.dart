import 'dart:convert';
import 'dart:io';
import 'package:airplane/models/user_model.dart';
import 'package:airplane/services/base.dart';
import 'package:airplane/services/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Client client = Client();
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      var url = Uri.parse(BaseUrl().getip() + '/api/login');
      final response = await client.post(url, headers: {
        HttpHeaders.acceptHeader: "application/json",
      }, body: {
        "email": email,
        "password": password,
      });
      var res = json.decode(response.body);
      print(response.statusCode);
      print('hasil ${res}');
      if (response.statusCode == 200) {
        var token = res['accessToken'].toString();
        var idUser = res['data']['id'].toString();
        sharedPreferences.setString('token', token);
        sharedPreferences.setString('idUser', idUser);
      }
      // UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      //   email: email,
      //   password: password,
      // );

      UserModel user =
          await UserService().getUserById(res['data']['id'].toString());
      // UserModel user = res['data'];
      // print(user);
      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> signUp(
      {required String email,
      required String password,
      required String name,
      required String konfirmasiPassword}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    try {
      // UserCredential userCredential = await _auth
      //     .createUserWithEmailAndPassword(email: email, password: password);
      var url = Uri.parse(BaseUrl().getip() + '/api/register');
      final response = await client.post(url, headers: {
        HttpHeaders.acceptHeader: "application/json",
      }, body: {
        "username": email,
        "email": email,
        "name": name,
        "password": password,
        "password_confirmation": konfirmasiPassword
      });
      var res = json.decode(response.body);
      print('status ${response.statusCode}');
      print('hasil regist ${res}');
      if (response.statusCode == 200) {
        var token = res['accessToken'].toString();
        var idUser = res['data']['id'].toString();
        sharedPreferences.setString('token', token);
        sharedPreferences.setString('idUser', idUser);
      }
      // UserCredential userCredential = await _auth
      //     .createUserWithEmailAndPassword(email: email, password: password);
      // UserModel user = UserModel(
      //     id: userCredential.user!.uid,
      //     email: email,
      //     name: name,
      //     // hobby: hobby,
      //     balance: 280000000);
      UserModel user = UserModel(
        id: res['data']['id'].toString(),
        email: email,
        name: name,
      );

      await UserService().setUser(user);

      return user;
    } catch (e) {
      throw e;
    }
  }

  Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      await prefs.remove('token');
      await prefs.clear();
      await _auth.signOut();
    } catch (e) {
      throw e;
    }
  }
}
