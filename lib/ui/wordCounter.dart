import 'package:encrypt_decrypt/data/chartModel.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

import 'drawers.dart';

class FrequenceWord extends StatefulWidget {
  static const routeName = "/counter";
  const FrequenceWord({Key key}) : super(key: key);

  @override
  _FrequenceWordState createState() => _FrequenceWordState();
}

class _FrequenceWordState extends State<FrequenceWord> {
  TextEditingController word = TextEditingController();
  TextEditingController count = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final data_no = Provider.of<ChartGetter>(context, listen: false);
    final data = Provider.of<ChartGetter>(context, listen: true);
    return Scaffold(
      drawer: Drawer(
        child: DrawersSide(),
      ),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Color(0xff35404D),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 50),
            child: TextFormField(
                controller: word,
                onChanged: (val) {
                  data_no.words = [];

                  data_no.addToword(ChartModel(
                      word: word.text.replaceAll(new RegExp(r"\s+"), ""),
                      counted: 1));
                },
                onFieldSubmitted: (val) {
                  data_no.words = [];

                  data_no.addToword(ChartModel(
                      word: word.text.replaceAll(new RegExp(r"\s+"), ""),
                      counted: 1));
                  word.text = val;
                },
                decoration: new InputDecoration(
                  labelText: "Enter Text",
                  fillColor: Colors.white,
                  border: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                    borderSide: new BorderSide(),
                  ),
                  //fillColor: Colors.green
                ),
                keyboardType: TextInputType.text),
          ),
          SizedBox(
            height: 50,
          ),
          Expanded(
            child: charts.BarChart(
              data.relist,
              animate: true,
              behaviors: [
                charts.ChartTitle(
                    "Frequence anlyzer By : mohamud mohamed mohamud",
                    behaviorPosition: charts.BehaviorPosition.top,
                    titleOutsideJustification:
                        charts.OutsideJustification.start,
                    innerPadding: 18),
                new charts.ChartTitle(data.currenCur.toString(),
                    behaviorPosition: charts.BehaviorPosition.bottom,
                    titleOutsideJustification:
                        charts.OutsideJustification.middleDrawArea),
              ],
              selectionModels: [
                new charts.SelectionModelConfig(
                    changedListener: (charts.SelectionModel model) {
                  data_no.curr(model.selectedSeries[0]
                      .measureFn(model.selectedDatum[0].index));
                })
              ],
            ),
          ),
          SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
