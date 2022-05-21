import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'loginpage.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController tname = TextEditingController();
  TextEditingController temail = TextEditingController();
  TextEditingController tcontact = TextEditingController();
  TextEditingController tpassword = TextEditingController();
  TextEditingController tconfrompassword = TextEditingController();

  bool namestatus = false;
  bool emailstatus = false;
  bool contactstatus = false;
  bool passwordstatus = false;
  bool confrompasswordstatus = false;
  bool showpassword = true;
  bool showconfpass = true;

  String emailerror = "";
  String contacterror = "";
  String passwoederror = "";
  String confpasserror = "";
  String profilepic = "";

  final ImagePicker _picker = ImagePicker();
  XFile? photo;

  bool status = false;

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.only(top: 100, left: 20, right: 20),
          children: [
            // InkWell(
            //     onTap: () {
            //       setState(() {
            //         showDialog(
            //           context: context,
            //           builder: (context) {
            //             return SimpleDialog(
            //               title: Text("Select Picture"),
            //               children: [
            //                 ListTile(
            //                   title: Text("Camera"),
            //                   leading: Icon(Icons.camera_alt),
            //                   onTap: () async {
            //                     photo = await _picker.pickImage(
            //                         source: ImageSource.camera);
            //                     Navigator.pop(context);
            //                     setState(() {
            //                       // status = true;
            //                     });
            //                   },
            //                 ),
            //                 ListTile(
            //                   title: Text("Gallery"),
            //                   leading: Icon(Icons.photo),
            //                   onTap: () async {
            //                     photo = await _picker.pickImage(
            //                         source: ImageSource.gallery);
            //                     Navigator.pop(context);
            //                     setState(() {
            //                       // status = true;
            //                     });
            //                   },
            //                 )
            //               ],
            //             );
            //           },
            //         );
            //       });
            //     },
            //     child: Container(
            //       alignment: Alignment.center,
            //       // color: Colors.brown,
            //       child: CircleAvatar(
            //         radius: 60,
            //         child: Container(
            //           decoration: BoxDecoration(
            //             shape: BoxShape.circle,
            //             // color: Colors.green,
            //             image: DecorationImage(
            //                 image: photo != null
            //                     ? FileImage(File(photo!.path))
            //                     : AssetImage("images/3.jpg") as ImageProvider,
            //                 fit: BoxFit.cover),
            //           ),
            //         ),
            //       ),
            //     )
            // ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextField(
                style: TextStyle(fontSize: 15),
                controller: tname,
                keyboardType: TextInputType.name,
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                      namestatus = false;
                    }
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Name",
                  // prefixIcon: Icon(Icons.person),
                  errorText: namestatus ? "please Enter Name.." : null,
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
                  setState(() {
                    if (value.isNotEmpty) {
                      contactstatus = false;
                    }
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Mobile No.",
                  // prefixIcon: Icon(Icons.phone),
                  errorText: contactstatus ? "$contacterror" : null,
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
                  setState(() {
                    if (value.isNotEmpty) {
                      emailstatus = false;
                    }
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Email ID",
                  // prefixIcon: Icon(Icons.mail),
                  errorText: emailstatus ? "$emailerror" : null,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextField(
                style: TextStyle(fontSize: 15),
                controller: tpassword,
                keyboardType: TextInputType.visiblePassword,
                obscureText: showpassword,
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                      passwordstatus = false;
                    }
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "Password",
                  // prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showpassword = !showpassword;
                      });
                    },
                    icon: Icon(
                        showpassword ? Icons.visibility : Icons.visibility_off),
                  ),
                  errorText: passwordstatus ? "$passwoederror" : null,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: TextField(
                style: TextStyle(fontSize: 15),
                controller: tconfrompassword,
                keyboardType: TextInputType.visiblePassword,
                obscureText: showconfpass,
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                      confrompasswordstatus = false;
                    }
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: "ConfromPassword",
                  // prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showconfpass = !showconfpass;
                      });
                    },
                    icon: Icon(
                        showconfpass ? Icons.visibility : Icons.visibility_off),
                  ),
                  errorText: confrompasswordstatus ? "$confpasserror" : null,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 90, right: 90),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    String name = tname.text;
                    String contact = tcontact.text;
                    String email = temail.text;
                    String password = tpassword.text;
                    String cpassword = tconfrompassword.text;

                    bool contactvalid =
                        RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(contact);
                    bool emaValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(email);

                    // if (name.isEmpty &&
                    //     contact.isEmpty &&
                    //     email.isEmpty &&
                    //     password.isEmpty &&
                    //     cpassword.isEmpty) {
                    //   namestatus = true;
                    //
                    //   contactstatus = true;
                    //   contacterror = "Please Enter Mobile No.";
                    //
                    //   emailstatus = true;
                    //   emailerror = "Please Enter Email Id";
                    //
                    //   passwordstatus = true;
                    //   passwoederror = "Please enter Password...";
                    //
                    //   confrompasswordstatus = true;
                    //   confpasserror = "Please enter Confirm Password...";
                    // }
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
                    if (password.isEmpty) {
                      passwordstatus = true;
                      passwoederror = "Please enter Password...";
                    }

                    if (cpassword.isEmpty) {
                      confrompasswordstatus = true;
                      confpasserror = "Please enter Confirm Password...";
                    }
                    if (cpassword != password) {
                      confrompasswordstatus = true;
                      confpasserror =
                          "Confirm Password or password not match...";
                    } else {
                      if (password == cpassword) {
                        registeruser();


                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("Password and Confirm Password not match.."),
                        ));
                      }

                    }
                  });
                },
                child: Text(
                  "  Sign IN  ",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> registeruser() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: temail.text,
        password: tpassword.text,
      );
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return LoginPage();
        },
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
