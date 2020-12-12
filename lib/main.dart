import 'package:encrypt_decrypt/data/chartModel.dart';
import 'package:encrypt_decrypt/ui/DesUi.dart';
import 'package:encrypt_decrypt/ui/aes_UI.dart';
import 'package:encrypt_decrypt/ui/rsa.dart';
import 'package:encrypt_decrypt/ui/wordCounter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './ui/HomePage.dart';
import './ui/HillCipherUi.dart';
import './ui/wordCounter.dart';
import './data/Calc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Calc(),
        ),
        ChangeNotifierProvider.value(value: ChartGetter())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Casear ',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          primaryColor: Colors.black,
        ),
        home: HomePage(),
        routes: {
          HomePage.routeName: (ctx) => HomePage(),
          FrequenceWord.routeName: (ctx) => FrequenceWord(),
          HillCiherUi.routeNmae: (ctx) => HillCiherUi(),
          DesUi.routeName: (ctx) => DesUi(),
          AesUi.routeName: (ctx) => AesUi(),
          RsaUi.routeName: (ctx) => RsaUi()
        },
      ),
    );
  }
}
