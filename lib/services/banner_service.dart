import 'dart:convert';
import 'package:airplane/services/base.dart';
import 'package:airplane/services/token.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/banner_model.dart';
import 'package:http/http.dart' show Client;

class BannerService {
  // CollectionReference _destinationReference =
  //     FirebaseFirestore.instance.collection('destinations');

  // Future<List<DestinationModel>> fetchDestinations() async {
  //   try {
  //     QuerySnapshot result = await _destinationReference.get();

  //     List<DestinationModel> destinations = result.docs.map(
  //       (e) {
  //         return DestinationModel.fromJson(
  //             e.id, e.data() as Map<String, dynamic>);
  //       },
  //     ).toList();
  //     print('dani,${destinations}');
  //     return destinations;
  //   } catch (e) {
  //     throw e;
  //   }
  // }
  Client client = Client();
  Future<BannerModel> getBanner() async {
    var header = await Token.header();
    var url = Uri.parse(BaseUrl().getip() + '/api/v1/banners');
    var response = await client.get(url, headers: header);
    var res = jsonDecode(response.body);
    print('abdul==${res}');
    if (response.statusCode == 200) {
      return BannerModel.fromJson(res.data);
    } else {
      throw 'errro';
    }
  }
}
