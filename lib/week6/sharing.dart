import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class share extends StatefulWidget {
  const share({Key? key}) : super(key: key);

  @override
  State<share> createState() => _shareState();
}

class _shareState extends State<share> {
  TextEditingController shareText = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? photo;



  Future<void> click(socialsharing share) async {
    String msg =
        'Flutter share is great!!\n Check out full example at https://pub.dev/packages/flutter_share_me';
    String url =
        'https://images.unsplash.com/photo-1610878180933-123728745d22?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1974&q=80';

    String? response;
    final FlutterShareMe flutterShareMe = FlutterShareMe();
    switch (share) {
      case socialsharing.facebook:
        response = await flutterShareMe.shareToFacebook(
          url: url,
          msg: shareText.text,
        );
        break;

      case socialsharing.twitter:
        if (shareText.text.isNotEmpty) {
          response = await flutterShareMe.shareToTwitter(msg: shareText.text);
        } else {
          Fluttertoast.showToast(msg: "Please enter message",backgroundColor: Colors.black26);
        }
        break;
      case socialsharing.whatsapp:
        if (photo != null) {
          response = await flutterShareMe.shareToWhatsApp(
              imagePath: photo!.path, msg: shareText.text);
        } else {
          Fluttertoast.showToast(msg: "Please upload image");
        }
        break;

      case socialsharing.instagram:
        if (photo != null) {
          response =
          await flutterShareMe.shareToInstagram(filePath: photo!.path);
        } else {
          Fluttertoast.showToast(msg: "Please upload image");
        }
        break;
    }
    debugPrint(response);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Share"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,

          children: [
            InkWell(
              onTap: () async {
                photo = await _picker.pickImage(source: ImageSource.gallery);
                setState(() {});
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: photo != null
                            ? FileImage(File(photo!.path))
                            : AssetImage('image/user.jpg') as ImageProvider,
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50, left: 10, right: 10),
              child: TextField(
                controller: shareText,
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(70),
              child: Row(
                children: [
                  IconButton(
                    iconSize: 50,
                      color: Colors.blue,
                      onPressed: () => click(socialsharing.facebook),
                      icon: Icon(FontAwesomeIcons.facebook)),
                  IconButton(
                      iconSize: 50,
                      color: Colors.pinkAccent,
                      onPressed: () => click(socialsharing.instagram),
                      icon: Icon(FontAwesomeIcons.instagram)),
                  IconButton(
                      iconSize: 50,
                      color: Colors.blue,
                      onPressed: () => click(socialsharing.twitter),
                      icon: Icon(FontAwesomeIcons.twitter)),
                  IconButton(
                      iconSize: 50,
                      color: Colors.green,
                      onPressed: () => click(socialsharing.whatsapp),
                      icon: Icon(FontAwesomeIcons.whatsapp)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}

enum socialsharing { facebook, whatsapp, twitter, instagram }
