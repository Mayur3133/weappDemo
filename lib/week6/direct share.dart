import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_plus/share_plus.dart';

class defaultsharing extends StatefulWidget {
  const defaultsharing({Key? key}) : super(key: key);

  @override
  State<defaultsharing> createState() => _defaultsharingState();
}

class _defaultsharingState extends State<defaultsharing> {
  TextEditingController shareText = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  XFile? photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Default Sharing"),
      ),
      body: GestureDetector(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  if (photo == null) {
                    Fluttertoast.showToast(
                        msg: "Please select image",
                        backgroundColor: Colors.black26);
                  }
                  ;
                  await Share.shareFiles([photo!.path], text: shareText.text);
                },
                child: Text("Share"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
