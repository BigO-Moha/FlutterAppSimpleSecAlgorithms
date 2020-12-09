import 'package:flutter/foundation.dart';
import 'package:charts_flutter/flutter.dart';

class ChartModel with ChangeNotifier {
  final String word;
  int counted;

  ChartModel({@required this.word, this.counted = 1});
}

class ChartGetter with ChangeNotifier {
  List<ChartModel> words = [];
  int currenCur;

  get relist {
    return [
      new Series<ChartModel, String>(
        id: 'Word Counter',
        colorFn: (_, __) => MaterialPalette.blue.shadeDefault,
        domainFn: (ChartModel word, _) => word.word,
        measureFn: (ChartModel count, _) => count.counted,
        data: words,
      )
    ];
  }

  void addToword(ChartModel info) async {
    print(info.word);
    for (var i = 0; i < info.word.length; i++) {
      words.forEach((element) {
        if (element.word == info.word[i]) {
          element.counted = 1;
        }
      });
      if (!words.contains(ChartModel(word: info.word[i], counted: 1)))
        words.add(ChartModel(
            word: info.word[i],
            counted: info.word[i].allMatches(info.word).length));
    }
    notifyListeners();
  }

  void curr(int curr) {
    currenCur = curr;
    notifyListeners();
  }
}
