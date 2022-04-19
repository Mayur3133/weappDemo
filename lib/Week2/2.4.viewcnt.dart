import 'package:flutter/material.dart';
import 'package:fluttertask/Week2/2.4.1.dart';

class scr extends StatefulWidget {
  const scr({Key? key}) : super(key: key);

  @override
  State<scr> createState() => _scrState();
}

class _scrState extends State<scr> {
  TextEditingController temail = TextEditingController();
  TextEditingController tpassword = TextEditingController();

  // bool status = false;
  bool estatus = false;
  bool pststus = false;

  String emailerror = "";
  String passworderror = "";

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      appBar: AppBar(
        title: Text("ViewController"),
      ),
      body: SafeArea(
          child: Container(
        child: ListView(children: [
          Container(
            margin: EdgeInsets.only(top: 40, bottom: 10, left: 10, right: 10),
            child: TextField(
              controller: temail,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                setState(() {
                  if (value.isNotEmpty) estatus = false;
                });
              },
              decoration: InputDecoration(
                  label: Text('Email'),
                  errorText: estatus ? "$emailerror" : null,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 20, left: 10, right: 10),
            child: TextField(
              controller: tpassword,
              onChanged: (value) {
                setState(() {
                  if (value.isNotEmpty) pststus = false;
                });
              },
              decoration: InputDecoration(
                  label: Text('Password'),
                  errorText: pststus ? "$passworderror" : null,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 150, right: 150),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  String email = temail.text;
                  String password = tpassword.text;

                  bool emailValid = RegExp(
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                      .hasMatch(email);
                  if (email.isEmpty && password.isEmpty) {
                    estatus = true;
                    emailerror = "please enter Email";
                    pststus = true;
                    passworderror = "enter Passoword";
                  } else if (email.isEmpty) {
                    estatus = true;
                    emailerror = "please enter Email";
                  } else if (password.isEmpty) {
                    pststus = true;
                    passworderror = "enter Passoword";
                  } else if (!emailValid) {
                    estatus = true;
                    emailerror = "please enter valid Email";
                  }
                  else {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return viewc(
                          email: email,
                          password: password,
                          edit: (a, b) {
                            temail.text = a;
                            tpassword.text = b;
                          },
                        );
                      },
                    ));
                  }
                });
              },
              child: Text('Login'),
            ),
          ),
        ]),
      )),
    );
  }
}
