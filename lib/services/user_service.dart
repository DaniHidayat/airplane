import 'dart:convert';
import 'dart:io';
import 'package:airplane/models/user_model.dart';
import 'package:airplane/services/base.dart';
import 'package:airplane/services/token.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' show Client;
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  CollectionReference _userReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      _userReference.doc(user.id).set({
        'email': user.email,
        'name': user.name,
        'hobby': user.hobby,
        'balance': user.balance,
      });
    } catch (e) {
      throw e;
    }
  }

  Future<UserModel> getUserById(String id) async {
    Client client = Client();
    var header = await Token.header();
    print('header${header}');
    var idUser = int.parse(id);
    try {
      var url = Uri.parse(BaseUrl().getip() + '/api/v1/users/${idUser}');
      final response = await client.get(url, headers: header);
      var res = json.decode(response.body);

      return UserModel(
          id: idUser.toString(),
          email: res['data']['email'],
          name: res['data']['name']);
    } catch (e) {
      throw e;
    }
  }
}
