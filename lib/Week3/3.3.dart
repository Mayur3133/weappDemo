import 'package:flutter/material.dart';
import 'package:fluttertask/Week3/3.3.db.dart';
import 'package:fluttertask/Week3/3.3.view.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
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
                        data().datainsert(database!, Email, Password);
                        email.text = "";
                        password.text = "";
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
    );
  }
}
