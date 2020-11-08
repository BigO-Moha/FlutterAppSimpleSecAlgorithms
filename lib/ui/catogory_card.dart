import 'package:encrypt_decrypt/data/my_text.dart';
import 'package:flutter/material.dart';

class CatGrid extends StatelessWidget {
  final String text;
  final IconData icon;
  const CatGrid({Key key, this.text, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      color: Color(0xffE7F8FF),
      elevation: 10,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        height: 120,
        alignment: Alignment.center,
        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child: Icon(icon, size: 40, color: Colors.grey[600]),
            ),
            Text(text,
                textAlign: TextAlign.center,
                style: MyText.subhead(context)
                    .copyWith(color: Colors.grey[800])),
          ],
        ),
      ),
    );
  }
}
