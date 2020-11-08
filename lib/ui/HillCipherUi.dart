import 'package:encrypt_decrypt/ui/dialogCalc.dart';
import 'package:flutter/material.dart';
import './drawers.dart';

class HillCiherUi extends StatefulWidget {
  static const routeNmae = "/Hill";
  const HillCiherUi({Key key}) : super(key: key);

  @override
  _HillCiherUiState createState() => _HillCiherUiState();
}

class _HillCiherUiState extends State<HillCiherUi> {
  final _formKey = GlobalKey<FormState>();
  bool isEncryption = true;
  TextEditingController text = TextEditingController();
  TextEditingController key = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawersSide(),
      appBar: AppBar(
          backgroundColor: Color(0xff35404D),
          title: new Text("Cryptography"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.history),
              onPressed: () {},
            ), // overflow menu
          ]),
      body: Padding(
          child: Form(
            key: _formKey,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: ListTile(
                    leading: const Icon(Icons.text_snippet, color: Colors.red),
                    title: new TextFormField(
                      validator: (value) {
                        if (value.length > 4) {
                          return "Enter Short Text";
                        }
                        if (value.isEmpty) {
                          return "Enter Text";
                        }
                      },
                      controller: text,
                      decoration: new InputDecoration(
                        hintText: isEncryption
                            ? "Plain Text - (Encryption)"
                            : "Cipher Text - (Decryption)",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListTile(
                    leading: const Icon(Icons.format_list_numbered),
                    title: new TextFormField(
                      controller: key,
                      decoration: new InputDecoration(
                        hintText: "key",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 20)),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            backgroundColor: Colors.purple,
            child: isEncryption ? Icon(Icons.lock) : Icon(Icons.lock_open),
            onPressed: () {
              setState(() {
                isEncryption = !isEncryption;
              });
            },
          ),
          SizedBox(
            width: 40,
          ),
          FloatingActionButton(
            heroTag: "btn2",
            child: Icon(Icons.calculate),
            onPressed: () {
              setState(() {
                showDialog(
                    context: context,
                    builder: (_) =>
                        CalcDialog(isEncrypted: isEncryption, text: "hello"));
              });
            },
          ),
        ],
      ),
    );
  }
}
