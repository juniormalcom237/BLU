import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:get_storage/get_storage.dart';
import 'package:openxtech_starter/Application/Features/data_layer/code_data.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:encrypt/encrypt.dart';
import 'package:crypto/crypto.dart';

import '../../http/code.dart';

class Encryption {
  static final Encryption instance = Encryption._();

  late IV _iv;
  late Encrypter _encrypter;
  final data = GetStorage();

  Encryption._() {
    var mykey = data.read('publicKey');
    print('My key $mykey 9');
    final myiv = data.read('privateKey');
    final keyUtf8 = utf8.encode(mykey);
    final ivUtf8 = utf8.encode(myiv);
    final key = sha256.convert(keyUtf8).toString().substring(0, 32);
    final iv = sha256.convert(ivUtf8).toString().substring(0, 16);
    _iv = IV.fromUtf8(iv);

    _encrypter = Encrypter(AES(Key.fromUtf8(key), mode: AESMode.cbc));
  }

  String encrypt(String value) {
    return _encrypter.encrypt(value, iv: _iv).base64;
  }

  String decrypt(String base64value) {
    final encrypted = Encrypted.fromBase64(base64value);
    return _encrypter.decrypt(encrypted, iv: _iv);
  }
}

// class EncryptData {
// //for AES Algorithms
//
//   static Encrypted? encrypted;
//   static var decrypted;
//
//   late IV _iv;
//
//   var mykey = Database().publicKey;
//   var myiv = Database().privateKey;
//
//   void encryptAES(plainText) {
//     // final key = Key.fromUtf8(data.publicKey);
//     // final iv = IV.fromLength(16);
//     // final encrypter = Encrypter(AES(key));
//     // encrypted = encrypter.encrypt(plainText, iv: iv);
//     // print(encrypted!.base64);
//     final keyUtf8 = utf8.encode(mykey);
//     final ivUtf8 = utf8.encode(myiv);
//     final key = sha256.convert(keyUtf8).toString().substring(0, 32);
//     final iv = sha256.convert(ivUtf8).toString().substring(0, 16);
//     _iv = IV.fromUtf8(iv);
//     final encrypter = Encrypter(AES(Key.fromUtf8(key), mode: AESMode.cbc));
//     // var json = jsonEncode({"email": email, "password": password});
//     var encrypt = encrypter.encrypt(plainText, iv: _iv).base64;
//   }
//
//   void decryptAES(plainText) {
//     final keyUtf8 = utf8.encode(mykey);
//     final ivUtf8 = utf8.encode(myiv);
//
//     final encrypter = Encrypter(AES(key));
//     decrypted = encrypter.decrypt(encrypted!, iv: iv);
//     print(decrypted);
//   }
// }

class Login {
  String? email;

  String? password;

  final data = GetStorage();

  Login({
    this.email,
    this.password,
  });

  Login.fromJson(dynamic json) {
    email = json['email'];
    password = json['password'];
    // authKey = json['authKey'];
  }
  String toJson({required String email, required String password}) {
    Encryption encryption;
    var json = jsonEncode({"email": email, "password": password});
    print(Encryption.instance.encrypt(json));
    return Encryption.instance.encrypt(json);
  }

  Future<void> LoginUser(String email, String password) async {
    var baseUrl = "https://www.blucash.net/mobile/signup";
    String token = await Database().getPublicKey();

    final header = {
      'OXKEY': token,
    };
    final response = await http.post(
      Uri.parse(
        '$baseUrl',
      ),
      body: {
        'data': toJson(email: email, password: password),
      },
      headers: header,
    );

    if (response.statusCode == 200) {
      print('token $token');
      var pr = data.read('privateKey');

      var decrypt = Encryption.instance.decrypt(response.body);
      print(decrypt);
    } else {
      print(response.body);
      throw Exception('Failed to load Data');
    }
  }
}
