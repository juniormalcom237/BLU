import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Database extends ChangeNotifier {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  final box = GetStorage();

  String _privateKey = "";
  String _publicKey = "";

  String get privateKey => _privateKey;
  String get publicKey => _publicKey;

  void savePrivateKey(String privateKey) async {
    SharedPreferences data = await _pref;
    data.setString("privateKey", privateKey);

    box.write('privateKey', privateKey);
    _privateKey = privateKey;
    notifyListeners();
  }

  void GsavePrivateKey(String privateKey) async {
    // SharedPreferences data = await _pref;
    // data.setString("privateKey", privateKey);
    // _privateKey = privateKey;
    box.write('privateKey', privateKey);
    notifyListeners();
  }

  void savePublicKey(String publicKey) async {
    SharedPreferences data = await _pref;
    data.setString('publicKey', publicKey);
    _publicKey = publicKey;
    box.write('publicKey', publicKey);
    notifyListeners();
  }

  void GsavePublicKey(String publicKey) async {
    // SharedPreferences data = await _pref;
    // data.setString('publicKey', publicKey);
    // _publicKey = publicKey;
    box.write('publicKey', publicKey);
    notifyListeners();
  }

  Future<String> getPrivateKey() async {
    SharedPreferences data = await _pref;
    if (data.containsKey('privateKey')) {
      String value = data.getString('privateKey')!;
      _privateKey = value;
      notifyListeners();
      return value;
    } else {
      _privateKey = "";
      notifyListeners();
      return "";
    }
  }

  String GgetPrivateKey() {
    // if (data.containsKey('privateKey')) {
    //   String value = data.getString('privateKey')!;
    //   _privateKey = value;
    //   notifyListeners();
    //   return value;
    // } else {
    //   _privateKey = "";
    //   notifyListeners();
    //   return "";
    // }
    // print(box.getKeys());

    if (box.getKeys().val('privateKey')) {
      String value = box.read("privateKey");
      notifyListeners();
      return value;
    } else {
      notifyListeners();
      return "";
    }
    // if(box)
  }

  Future<String> getPublicKey() async {
    SharedPreferences data = await _pref;
    if (data.containsKey('publicKey')) {
      String value = data.getString('publicKey')!;
      _publicKey = value;

      notifyListeners();
      return value;
    } else {
      _publicKey = "";
      notifyListeners();
      return "";
    }
  }

  String GgetPublicKey() {
    if (box.getKeys().val('publicKey')) {
      String value = box.read('publicKey')!;
      _publicKey = value;
      notifyListeners();
      return value;
    } else {
      _publicKey = "";
      notifyListeners();
      return "";
    }
  }

  void logout() async {
    var value = await _pref;
    value.clear();
    notifyListeners();
  }
}

void main() {
  Database().GgetPrivateKey();
}
