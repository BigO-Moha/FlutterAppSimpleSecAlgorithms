import 'package:encrypt_decrypt/data/Calc.dart';
import 'package:encrypt_decrypt/data/my_colors.dart';
import 'package:provider/provider.dart';
import 'package:encrypt_decrypt/data/my_text.dart';
import 'package:flutter/material.dart';

import 'catogory_card.dart';
import 'drawers.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/Home";
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextStyle textStyle =
      TextStyle(color: Colors.black, height: 1.4, fontSize: 16);
  TextStyle labelStyle = TextStyle(color: Colors.black);
  UnderlineInputBorder lineStyle1 = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 1));
  UnderlineInputBorder lineStyle2 = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.amber[500], width: 2));
  PersistentBottomSheetController sheetController;
  BuildContext _scaffoldCtx;
  bool showSheet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawersSide(),
      ),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          backgroundColor: Color(0xff35404D),
          title: new Text("Cryptography"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.history),
              onPressed: () {},
            ), // overflow menu
          ]),
      body: Builder(
        builder: (BuildContext ctx) {
          _scaffoldCtx = ctx;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: Image.asset("asset/aa.jpg", fit: BoxFit.cover),
                  ),
                  Container(
                    color: Colors.black.withOpacity(0.4),
                    height: 200,
                    width: double.infinity,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                          "Encypt And Decrypt using Transportation Algorithim",
                          textAlign: TextAlign.center,
                          style: MyText.medium(context).copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                transform: Matrix4.translationValues(0.0, -30.0, 0.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                            child: CatGrid(
                                text: "Encrypton with variable key",
                                icon: Icons.security),
                            onTap: () {
                              setState(() {
                                showSheet = !showSheet;
                                if (showSheet) {
                                  _showSheet(
                                      title: "Encryption using Variable Key");
                                } else {
                                  Navigator.pop(_scaffoldCtx);
                                }
                              });
                            }),
                        InkWell(
                          child: CatGrid(
                              text: "Encrypton with default key",
                              icon: Icons.enhanced_encryption),
                          onTap: () {
                            setState(() {
                              showSheet = !showSheet;
                              if (showSheet) {
                                _showSheet(
                                    title: "Encryption using default Key 3",
                                    keys: true);
                              } else {
                                Navigator.pop(_scaffoldCtx);
                              }
                            });
                          },
                        ),
                        InkWell(
                            child: CatGrid(
                                text: "decryption with key",
                                icon: Icons.security_rounded),
                            onTap: () {
                              setState(() {
                                showSheet = !showSheet;
                                if (showSheet) {
                                  _showSheet(
                                      title: "decryption using variable Key",
                                      isEncryped: false);
                                } else {
                                  Navigator.pop(_scaffoldCtx);
                                }
                              });
                            }),
                      ],
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }

  void _showSheet({String title, bool keys = false, bool isEncryped = true}) {
    TextEditingController plain = TextEditingController();
    TextEditingController key = TextEditingController();
    sheetController = showBottomSheet(
        context: _scaffoldCtx,
        builder: (BuildContext bc) {
          final data = Provider.of<Calc>(context, listen: false);
          return Card(
            color: Colors.blueGrey,
            elevation: 10,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                color: Colors.blueAccent,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Container(
                          width: 30,
                          height: 5,
                          decoration: BoxDecoration(
                            color: MyColors.grey_10,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          )),
                    ),
                    Container(height: 10),
                    Row(
                      children: <Widget>[
                        Container(width: 50),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(title,
                                  style: MyText.headline(context)
                                      .copyWith(color: Colors.grey[800])),
                              Container(height: 20),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 6,
                                    child: TextField(
                                      controller: plain,
                                      style: textStyle,
                                      keyboardType: TextInputType.text,
                                      cursorColor: Colors.amber[500],
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: new BorderSide(
                                                color: Colors.teal)),
                                        hintText: "Plain text",
                                        labelText: "Plain Text",
                                        labelStyle: labelStyle,
                                        enabledBorder: lineStyle1,
                                        focusedBorder: lineStyle2,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: TextField(
                                      controller: key,
                                      style: textStyle,
                                      keyboardType: TextInputType.text,
                                      readOnly: keys ? true : false,
                                      cursorColor: Colors.amber[500],
                                      decoration: InputDecoration(
                                        hintText: keys ? "3" : "Enter Key",
                                        labelText: "Key",
                                        labelStyle: labelStyle,
                                        enabledBorder: lineStyle1,
                                        focusedBorder: lineStyle2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(height: 5),
                              Divider(),
                              Container(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Row(
                                    children: [
                                      Consumer<Calc>(
                                        builder: (context, value, child) =>
                                            Expanded(
                                          child: TextField(
                                            style: textStyle,
                                            keyboardType:
                                                TextInputType.multiline,
                                            cursorColor: Colors.amber[500],
                                            maxLines: 10,
                                            minLines: 2,
                                            decoration: InputDecoration(
                                              filled: true,
                                              hintText: value.state,
                                              hintStyle: MyText.body1(context)
                                                  .copyWith(color: Colors.red),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                                borderSide: BorderSide(
                                                    color: Colors.amber[500],
                                                    width: 2),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                                borderSide: BorderSide(
                                                    color: Colors.black,
                                                    width: 1),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ],
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 50,
                      child: Row(
                        children: [
                          FloatingActionButton(
                            child: Icon(Icons.enhanced_encryption_sharp),
                            onPressed: () {
                              if (plain.text != null && key.text != null) {
                                data.process(
                                    text: plain.text,
                                    key: keys
                                        ? 3
                                        : int.parse(key.text.toString()),
                                    isEncrypt: isEncryped ? true : false);
                              } else {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text("Enter Valid Data"),
                                ));
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          );
        });
    sheetController.closed.then((value) {
      setState(() {
        showSheet = false;
      });
    });
  }
}
