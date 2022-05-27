import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/week9-10/rdbms/viewdata.dart';
import 'package:image_picker/image_picker.dart';

class addemp extends StatefulWidget {
  const addemp({Key? key}) : super(key: key);

  @override
  _addempState createState() => _addempState();
}

class _addempState extends State<addemp> {
  TextEditingController tname = TextEditingController();
  TextEditingController temail = TextEditingController();
  TextEditingController tcontact = TextEditingController();
  TextEditingController tdesignation = TextEditingController();
  TextEditingController tid = TextEditingController();

  // TextEditingController tgender = TextEditingController();
  TextEditingController tsalary = TextEditingController();

  bool namestatus = false;
  bool emailstatus = false;
  bool contactstatus = false;
  bool designationstatus = false;
  bool idstatus = false;
  bool genderstatus = false;
  bool salarystatus = false;

  String emailerror = "";
  String contacterror = "";
  String designationerror = "";
  String iderror = "";
  String gendererror = "";
  String salaryerror = "";

  bool status = false;
  String vlu = '';
  File? _image;

  final auth = FirebaseAuth.instance;
  final databaseref = FirebaseDatabase.instance.ref('Employe');

  Set() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    // databaseref;
    // DatabaseReference databaseref = FirebaseDatabase.instance.ref('Employe');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(top: 100, left: 20, right: 20),
          children: [
            InkWell(
              onTap: () async {
                final photo = await ImagePicker.platform
                    .getImage(source: ImageSource.gallery, imageQuality: 50);
                _image = File(photo!.path);
                setState(() {});
              },
              child: _image != null
                  ? Container(
                  height: 100,
                  width: 80,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(_image!), fit: BoxFit.cover),
                      shape: BoxShape.circle,
                      color: Colors.grey))
                  : Container(
                  height: 100,
                  width: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey)),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextField(
                style: TextStyle(fontSize: 15),
                controller: tid,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    idstatus = false;
                  }
                  Set();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "EmpId",
                  errorText: idstatus ? "$iderror" : null,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextField(
                style: TextStyle(fontSize: 15),
                controller: tname,
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    namestatus = false;
                  }
                  Set();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Name",
                  errorText: namestatus ? "please Enter Name.." : null,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextField(
                style: TextStyle(fontSize: 15),
                controller: temail,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    emailstatus = false;
                  }
                  Set();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Email ID",
                  errorText: emailstatus ? "$emailerror" : null,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextField(
                style: TextStyle(fontSize: 15),
                controller: tcontact,
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    contactstatus = false;
                  }
                  Set();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Mobile No.",
                  errorText: contactstatus ? "$contacterror" : null,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextField(
                style: TextStyle(fontSize: 15),
                controller: tdesignation,
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    designationstatus = false;
                  }
                  Set();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Designation",
                  errorText: designationstatus ? "$designationerror" : null,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextField(
                style: TextStyle(fontSize: 15),
                controller: tsalary,
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    salarystatus = false;
                  }
                  Set();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Enter Salary",
                  errorText: salarystatus ? "$salaryerror" : null,
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Radio(
                value: 'Male',
                groupValue: vlu,
                toggleable: true,
                onChanged: (value) {
                  vlu = value.toString();
                  Set();
                },
              ),
              Text('Male'),
              Radio(
                  value: 'Female',
                  groupValue: vlu,
                  toggleable: true,
                  onChanged: (value) {
                    vlu = value.toString();
                    Set();
                  }),
              Text('Female'),
            ]),
            Container(
              height: 40,
              padding: EdgeInsets.only(left: 110, right: 110),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () async {
                  String name = tname.text;
                  String contact = tcontact.text;
                  String email = temail.text;
                  String designation = tdesignation.text;
                  String id = tid.text;
                  String salary = tsalary.text;
                  // String gender = tgender.text;

                  bool contactvalid =
                  RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(contact);
                  bool emaValid = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(email);

                  if (name.isEmpty) {
                    namestatus = true;
                  }
                  if (contact.isEmpty) {
                    contactstatus = true;
                    contacterror = "Please Enter Mobile No.";
                  }
                  if (!contactvalid) {
                    contactstatus = true;
                    contacterror = "Please Enter Valid Mobile No.";
                  }
                  if (email.isEmpty) {
                    emailstatus = true;
                    emailerror = "Please Enter Email Id";
                  }
                  if (!emaValid) {
                    emailstatus = true;
                    emailerror = "Please Enter valid Emial Id";
                  }
                  if (designation.isEmpty) {
                    designationstatus = true;
                    designationerror = "Please enter your designation";
                  }

                  if (id.isEmpty) {
                    idstatus = true;
                    iderror = "Please enter your id";
                  }

                  if (salary.isEmpty) {
                    salarystatus = true;
                    salaryerror = "Please Enter salary";
                  } else {
                    if (_image == null) {} else {
                      String filename = "id-${tid.text}-${tname.text}";
                      final des = 'file/$filename';
                      TaskSnapshot snapshot = await FirebaseStorage.instance
                          .ref()
                          .child(des)
                          .putFile(_image!);
                      final String downloadUrl =
                      await snapshot.ref.getDownloadURL();
                      String? key = databaseref
                          .child('Employe')
                          .push()
                          .key;
                      databaseref.child('Employe').child(key!).set({
                        'id': tid.text,
                        'Name': tname.text,
                        'email': temail.text,
                        'contact': tcontact.text,
                        'designation': tdesignation.text,
                        'salary': tsalary.text,
                        'gender': vlu.toString(),
                        'key': key,
                        'url': downloadUrl,
                      });
                      tid.clear();
                      tname.clear();
                      temail.clear();
                      tcontact.clear();
                      tdesignation.clear();
                      tsalary.clear();
                      vlu = '';
                      _image = null;
                    }
                  }
                  Set();
                },
                child: Text(
                  " Add ",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 40,
              padding: EdgeInsets.only(left: 110, right: 110),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => viewdata(),
                        ));
                  },
                  child: Text("View")),
            )
          ],
        ),
      ),
    );
  }
}
