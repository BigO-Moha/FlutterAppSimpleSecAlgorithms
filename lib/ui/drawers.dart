import 'package:encrypt_decrypt/data/my_text.dart';
import 'package:flutter/material.dart';

class DrawersSide extends StatelessWidget {
  const DrawersSide({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 190,
              child: Stack(
                children: <Widget>[
                  Image.asset(
                    'asset/material_bg_1.png',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(vertical: 40, horizontal: 14),
                  //   child: CircleAvatar(
                  //     radius: 36,
                  //     backgroundColor: Colors.grey[100],
                  //     child: CircleAvatar(
                  //       radius: 33,
                  //       backgroundImage:
                  //           AssetImage(Img.get("photo_male_6.jpg")),
                  //     ),
                  //   ),
                  // ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Mohamud BigO",
                              style: MyText.body2(context).copyWith(
                                  color: Colors.grey[100],
                                  fontWeight: FontWeight.bold)),
                          Container(height: 5),
                          Text("doon199p@gmail.com",
                              style: MyText.body2(context)
                                  .copyWith(color: Colors.grey[100]))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text("Crypto-Cessier",
                  style: MyText.subhead(context).copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              leading: Icon(Icons.lock, size: 25.0, color: Colors.red),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/Home");
              },
            ),
            ListTile(
              title: Text("Word Frequence Counter",
                  style: MyText.subhead(context).copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              leading: Icon(Icons.graphic_eq, size: 25.0, color: Colors.red),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/counter");
              },
            ),
            ListTile(
              title: Text("HillCipher",
                  style: MyText.subhead(context).copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              leading:
                  Icon(Icons.network_locked, size: 25.0, color: Colors.red),
              onTap: () {
                Navigator.pushReplacementNamed(context, "/Hill");
              },
            ),
            ListTile(
              title: Text("Des encryption 15 Bit",
                  style: MyText.subhead(context).copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              leading: Icon(Icons.lock_sharp, size: 25.0, color: Colors.red),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/DesUi');
              },
            ),
            ListTile(
              title: Text("Aes Encryption 32 bit",
                  style: MyText.subhead(context).copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              leading: Icon(Icons.lock_sharp, size: 25.0, color: Colors.red),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/AesUi');
              },
            ),
            ListTile(
              title: Text("rsa Enc",
                  style: MyText.subhead(context).copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              leading: Icon(Icons.lock_sharp, size: 25.0, color: Colors.grey),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/RsaUi');
              },
            ),
            Divider(),
            ListTile(
              title: Text("about",
                  style: MyText.subhead(context).copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500)),
              leading: Icon(Icons.settings, size: 25.0, color: Colors.grey),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
