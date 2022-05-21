import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertask/Week3/3.3.db.dart';
import 'package:fluttertask/Week3/3.3.view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sqflite/sqflite.dart';

class sqfdb extends StatefulWidget {
  const sqfdb({Key? key}) : super(key: key);

  @override
  State<sqfdb> createState() => _sqfdbState();
}

class _sqfdbState extends State<sqfdb> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Database? database;

  bool estatus = false;
  bool pstatus = false;

  String emailerror = '';
  String passworderror = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data().dbs().then((value) {
      database = value;
    });
  }


  File? _image;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                InkWell(onTap: () async {
                  final photo = await ImagePicker.platform.getImage(
                      source: ImageSource.gallery,imageQuality: 50);
                  _image = File(photo!.path);
                  setState(() {});
                },
                  child: _image != null ? Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: FileImage(_image!),fit: BoxFit.cover),
                          shape: BoxShape.circle, color: Colors.grey)
                  ) : Container(
                      height: 200,
                      width: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey)),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  // height: 50,
                  // width: 100,
                  child: TextField(
                    controller: email,
                    onChanged: (value) {
                      setState(() {
                        if (value.isNotEmpty) estatus = false;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: 'Email',
                        errorText: estatus ? "$emailerror" : null,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  // height: 50,
                  //  width: 100,
                  child: TextField(
                    controller: password,
                    onChanged: (value) {
                      setState(() {
                        if (value.isNotEmpty) pstatus = false;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: 'Password',
                        errorText: pstatus ? "$passworderror" : null,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        String Email = email.text;
                        String Password = password.text;

                        bool emailValid = RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                            .hasMatch(Email);
                        if (Email.isEmpty && Password.isEmpty) {
                          estatus = true;
                          emailerror = "please enter Email";
                          pstatus = true;
                          passworderror = "enter Passoword";
                        } else if (Email.isEmpty) {
                          estatus = true;
                          emailerror = "please enter Email";
                        } else if (Password.isEmpty) {
                          pstatus = true;
                          passworderror = "enter Passoword";
                        } else if (!emailValid) {
                          estatus = true;
                          emailerror = "please enter valid Email";
                        } else {
                          String? _img;
                          if (_image != null) {
                            _img = base64Encode(_image!.readAsBytesSync());
                          }
                          data().datainsert(database!, Email, Password, _img);
                          email.text = "";
                          password.text = "";
                          _image=null;
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return viewpage();
                            },
                          ));
                        }
                      });
                    },
                    child: Text('Submit')),
                ElevatedButton(
                    onPressed: () {
                      _image=null;

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => viewpage(),
                          ));
                    },
                    child: Text('View')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
