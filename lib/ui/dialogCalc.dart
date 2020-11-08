import 'package:encrypt_decrypt/data/my_colors.dart';
import 'package:encrypt_decrypt/data/my_text.dart';
import 'package:flutter/material.dart';

class CalcDialog extends StatelessWidget {
  final String text;
  final bool isEncrypted;
  CalcDialog({Key key, this.text, this.isEncrypted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 160,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          color: Colors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Wrap(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                color: isEncrypted ? Colors.lightGreen[400] : Colors.red[400],
                child: Column(
                  children: <Widget>[
                    Container(height: 10),
                    Icon(Icons.verified_user, color: Colors.white, size: 80),
                    Container(height: 10),
                    Text(
                        isEncrypted
                            ? "Plain Text Encrypted!"
                            : "cipher Text Decryptrd",
                        style: MyText.title(context)
                            .copyWith(color: Colors.white)),
                    Container(height: 10),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Text(text,
                        textAlign: TextAlign.center,
                        style: MyText.subhead(context)
                            .copyWith(color: MyColors.grey_60)),
                    Container(height: 10),
                    FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0)),
                      child: Text(
                        "close",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: isEncrypted
                          ? Colors.lightGreen[500]
                          : Colors.red[400],
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
