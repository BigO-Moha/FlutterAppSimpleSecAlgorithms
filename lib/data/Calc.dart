import 'package:flutter/foundation.dart';
import 'package:dart_des/dart_des.dart';
import 'package:crypton/crypton.dart';
import 'package:encrypt/encrypt.dart' as en;
import 'dart:convert';
import 'package:convert/convert.dart';
import 'dart:io';
import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/asymmetric/api.dart';

class Calc with ChangeNotifier {
  RSAKeypair rsaKeypair = RSAKeypair.fromRandom();
  final iv = en.IV.fromLength(16);
  String caiserstate;
  Map desState = {};
  en.Encrypted encryptedaesState;
  var decryptedaesState;
  Map val = {};

  void process({bool isEncrypt = true, String text, int key}) {
    String _text = text;
    int _key = key;
    String _temp = "";
    bool _isEncrypt = isEncrypt;

    for (int i = 0; i < _text.length; i++) {
      int ch = _text.codeUnitAt(i);
      int offset;
      String h;
      if (ch >= 'a'.codeUnitAt(0) && ch <= 'z'.codeUnitAt(0)) {
        offset = 97;
      } else if (ch >= 'A'.codeUnitAt(0) && ch <= 'Z'.codeUnitAt(0)) {
        offset = 65;
      } else if (ch == ' '.codeUnitAt(0)) {
        _temp += " ";
        continue;
      } else {
        _temp = "";
        break;
      }

      int c;
      if (_isEncrypt) {
        c = (ch + _key - offset) % 26;
      } else {
        c = (ch - _key - offset) % 26;
      }
      h = String.fromCharCode(c + offset);
      _temp += h;
    }

    caiserstate = _temp;
    notifyListeners();
    print(caiserstate);
  }

  // void desEncryption(
  //     {bool isEncryption = true, String key, String text}) async {
  //   print(key.length);
  //   DES desECB = DES(key: key.codeUnits, mode: DESMode.ECB);
  //   if (key.length == 8 && isEncryption == true && text != null) {
  //     desState = desECB.encrypt(text.codeUnits);
  //   } else if (key.length == 8 && isEncryption == false && text != null) {
  //     desState = desECB.decrypt(text.codeUnits);
  //   } else {
  //     desState = 'Ivalid Data';
  //   }
  //   notifyListeners();
  // }

  // Future<String> aesEncryption(
  //     {bool isEncryption = true, String key, String text}) async {
  //   if (key.length == 32 && isEncryption == true && text != null) {
  //     var keys = en.Key.fromUtf8(key);
  //     final encrypter = en.Encrypter(en.AES(keys));

  //     encryptedaesState = encrypter.encrypt(text);
  //     print(encryptedaesState);
  //   } else if (key.length == 32 &&
  //       isEncryption == false &&
  //       text != null &&
  //       encryptedaesState != null) {
  //     var keys = en.Key.fromUtf8(key);
  //     final encrypter = en.Encrypter(en.AES(keys));
  //     decryptedaesState = encrypter.decrypt(encryptedaesState);
  //     return decryptedaesState.toString();
  //   } else {
  //     return "SomeError";
  //   }
  //   notifyListeners();
  // }

  // en.Encrypted encryptaes({String key, String text}) {
  //   final plainText = text;
  //   final keys = en.Key.fromUtf8(key);

  //   final encrypter = en.Encrypter(en.AES(keys));

  //   encryptedaesState = encrypter.encrypt(plainText, iv: iv);
  //   // print(encryptedaesState.base64);
  //   notifyListeners();
  //   return encryptedaesState;
  // }

  dynamic encrypt_decrypt({bool isEncryption = true, String key, String text}) {
    var enc = '';
    final keys = en.Key.fromUtf8(key);
    final encrypter = en.Encrypter(en.AES(keys));
    var encrypted = encrypter.encrypt(text, iv: iv);
    var decrypted = encrypter.decrypt(encrypted, iv: iv);
    print(decrypted);
    if (key.length == 32 && isEncryption == true && text != null) {
      val['enc'] = encrypted;
      val['dec'] = decrypted;

      return encrypted;
    } else if (key.length == 32 && isEncryption == false) {
      val['dec'] = decrypted;
      return decrypted;
    }
    notifyListeners();
  }

  dynamic encryptdes({bool isEncryption = true, String key, String message}) {
    // desState = null;
    DES desECB = DES(key: key.codeUnits, mode: DESMode.ECB);
    var encrypted = desECB.encrypt(message.codeUnits);
    var decrypted = desECB.decrypt(encrypted);
    print(encrypted);
    print(decrypted);
    if (key.length == 8 && isEncryption == true) {
      desState['enc'] = encrypted;
      return encrypted;
    } else if (key.length == 8 &&
        isEncryption == false &&
        desState['enc'] != null) {
      desState['dec'] = decrypted;
      return decrypted;
    } else {
      print("error");
    }

    notifyListeners();
  }

  void rsaEncryption({bool isEncrytion = true, String text}) async {
    if (isEncrytion == true && text != null) {
      String encrypted = rsaKeypair.publicKey.encrypt(text);
      val['enc'] = encrypted;
    } else if (isEncrytion == false && text != null && val['enc'] != null) {
      String decrypted = rsaKeypair.privateKey.decrypt(val['enc']);
      val['dec'] = decrypted;
    }
    notifyListeners();
  }

  Future<dynamic> desDec({String key, String text}) async {
    String keys = key; // 8-byte
    String message = text;
    List<int> encrypted;
    List<int> decrypted;
    List<int> iv = [1, 2, 3, 4, 5, 6, 7, 8];
    DES desECB = DES(key: keys.codeUnits, mode: DESMode.ECB);
    encrypted = desECB.encrypt(message.codeUnits);
    decrypted = desECB.decrypt(encrypted);
    desState['enc'] = encrypted;
    desState['dec'] = decrypted;
    print(decrypted);
    notifyListeners();
    // if (key.length == 32 && isEncryption == true && text != null) {
    //   desState['enc'] = encrypted;
    //   desState['dec'] = decrypted;

    //   return encrypted;
    // } else if (key.length == 32 && isEncryption == false) {
    //   val['dec'] = decrypted;
    //   return decrypted;
    // }
    // notifyListeners();
  }

  // void decryptdes({String key, String message}) {
  //   DES desECB = DES(key: key.codeUnits, mode: DESMode.ECB);
  //   var re = desECB.decrypt(encryptdes(key: key, message: message));
  //   desState = hex.encode(re);
  //   notifyListeners();
  // }

//   void ca({String text, int key = 3}) {
//     for (var i = 0; i < text.length; i++){
//       var hold = aplha[text[i]] + key;
//       state +=
//           aplha.keys.firstWhere((k) => aplha[k] == hold, orElse: () => null);
//       notifyListeners();
//     }

//   }
}
