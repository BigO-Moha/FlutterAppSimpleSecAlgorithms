import 'package:flutter/foundation.dart';

class Calc with ChangeNotifier {
  String state;

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

    state = _temp;
    notifyListeners();
    print(state);
  }

//   void ca({String text, int key = 3}) {
//     for (var i = 0; i < text.length; i++){
//       var hold = aplha[text[i]] + key;
//       state +=
//           aplha.keys.firstWhere((k) => aplha[k] == hold, orElse: () => null);
//       notifyListeners();
//     }

//   }
}
