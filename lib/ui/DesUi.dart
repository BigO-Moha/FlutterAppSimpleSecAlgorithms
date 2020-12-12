import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:encrypt_decrypt/data/Calc.dart';
import 'package:encrypt_decrypt/ui/drawers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/my_text.dart';
import '../data/my_colors.dart';

class DesUi extends StatefulWidget {
  static const routeName = '/DesUi';
  DesUi({Key key}) : super(key: key);

  @override
  _DesUiState createState() => _DesUiState();
}

class _DesUiState extends State<DesUi> {
  String selected;
  final TextEditingController text = new TextEditingController();
  final TextEditingController key = new TextEditingController();
  final TextEditingController message = new TextEditingController();
  final TextEditingController mode = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Calc>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.grey,
      drawer: DrawersSide(),
      appBar: AppBar(
          backgroundColor: Color(0xff35404D),
          title: new Text("Des Encryption Using 8 bit"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.history),
              onPressed: () {},
            ), // overflow menu
          ]),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        scrollDirection: Axis.vertical,
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(height: 15),
                Text(mode.text == "encryption" ? "Plain Text" : "cipherText",
                    style: MyText.body1(context).copyWith(color: Colors.black)),
                Container(height: 5),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(0),
                  elevation: 0,
                  child: Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.emailAddress,
                      controller: text,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(-12),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(height: 15),
                Text("Key",
                    style: MyText.body1(context).copyWith(color: Colors.black)),
                Container(height: 5),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(0),
                  elevation: 0,
                  child: Container(
                    height: 40,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      maxLines: 1,
                      keyboardType: TextInputType.phone,
                      controller: key,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(-12),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(height: 15),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Mode",
                              style: MyText.body1(context)
                                  .copyWith(color: Colors.black)),
                          Container(height: 5),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            margin: EdgeInsets.all(0),
                            elevation: 0,
                            child: Container(
                              height: 40,
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                children: <Widget>[
                                  Container(width: 15),
                                  Expanded(
                                    child: TextField(
                                      maxLines: 1,
                                      keyboardType: TextInputType.phone,
                                      controller: mode,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(-12),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                  PopupMenuButton(
                                    onSelected: (val) {
                                      setState(() {
                                        mode.text = val;
                                        message.text = '';
                                      });
                                    },
                                    itemBuilder: (BuildContext context) =>
                                        <PopupMenuEntry<String>>[
                                      PopupMenuItem(
                                          child: Text('Encryption'),
                                          value: 'encryption'),
                                      PopupMenuItem(
                                          child: Text('Decryption'),
                                          value: 'decryption'),
                                    ],
                                    child: Icon(Icons.expand_more,
                                        color: MyColors.grey_40),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[],
                      ),
                    )
                  ],
                ),
                Container(height: 15),
                Text(mode.text == "encryption" ? "cipherText" : "PlainText",
                    style: MyText.body1(context).copyWith(color: Colors.black)),
                Container(height: 5),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  margin: EdgeInsets.all(0),
                  elevation: 0,
                  child: Container(
                    height: 100,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: <Widget>[
                        Container(width: 15),
                        Expanded(
                          child: TextField(
                            minLines: 1,
                            maxLines: 5,
                            keyboardType: TextInputType.multiline,
                            controller: message,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(-12),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(Icons.expand_more, color: MyColors.grey_40)
                      ],
                    ),
                  ),
                ),
                Container(height: 15),
                Container(
                  width: double.infinity,
                  height: 45,
                  child: FlatButton(
                    child: Text("SUBMIT",
                        style: MyText.subhead(context)
                            .copyWith(color: Colors.white)),
                    color: MyColors.primary,
                    onPressed: () async {
                      data.desDec(
                        key: key.text.toString(),
                        text: message.text.toString(),
                      );

                      setState(() {
                        mode.text == 'encryption'
                            ? message.text = hex.encode(data.desState['enc'])
                            : message.text = utf8.decode(data.desState['dec']);
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
