import 'dart:convert';

import 'package:flutter/material.dart';

import '../data_layer/code_data.dart';
import 'package:http/http.dart' as http;

class Keys extends ChangeNotifier {
  String? prkey;
  String? pubKey;
  String? authKey;

  Keys({this.prkey, this.pubKey, this.authKey});
  Keys.fromJson(dynamic json) {
    prkey = json['private'];
    pubKey = json['public'];
    // authKey = json['authKey'];
  }
  var baseUrl = "https://www.blucash.net/mobile/handshake";

  Future<Keys> fetchPrivateKey() async {
    String token = await Database().getPublicKey();
    final header = {
      'OXKEY': token,
    };
    final response = await http.post(
      Uri.parse(
        '$baseUrl',
      ),
      body: {"token": token},
      headers: header,
    );

    if (response.statusCode == 200) {
      print(response.statusCode);
      print(jsonDecode(response.body));
      final res = jsonDecode(response.body);
      Database().savePrivateKey(res['private'].toString());
      Database().savePublicKey(res['public'].toString());
      notifyListeners();
      return Keys.fromJson(res);
    } else {
      print(response.statusCode);
      throw Exception('Failed to load Data');
    }
  }
}
