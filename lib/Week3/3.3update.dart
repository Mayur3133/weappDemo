import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '3.3.db.dart';
import '3.3.view.dart';

class upd extends StatefulWidget {
  Map map;

  upd(this.map);

  @override
  State<upd> createState() => _updState();
}

class _updState extends State<upd> {
  TextEditingController temail = TextEditingController();
  TextEditingController tpassword = TextEditingController();

  bool estatus = false;
  bool pstatus = false;

  String temailerror = '';
  String tpassworderror = '';

  Database? database;
  int userid = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userid = widget.map['id'];
    temail.text = widget.map['email'];
    tpassword.text = widget.map['password'];
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
                  controller: temail,
                  onChanged: (value) {
                    setState(() {
                      if (value.isNotEmpty) estatus = false;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Email',
                      errorText: estatus ? "$temailerror" : null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                // height: 50,
                //  width: 100,
                child: TextField(
                  controller: tpassword,
                  onChanged: (value) {
                    setState(() {
                      if (value.isNotEmpty) pstatus = false;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Password',
                      errorText: pstatus ? "$tpassworderror" : null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      String Email = temail.text;
                      String Password = tpassword.text;

                      bool emailValid = RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                          .hasMatch(Email);
                      if (Email.isEmpty && Password.isEmpty) {
                        estatus = true;
                        temailerror = "please enter Email";
                        pstatus = true;
                        tpassworderror = "enter Passoword";
                      } else if (Email.isEmpty) {
                        estatus = true;
                        temailerror = "please enter Email";
                      } else if (Password.isEmpty) {
                        pstatus = true;
                        tpassworderror = "enter Passoword";
                      } else if (!emailValid) {
                        estatus = true;
                        temailerror = "please enter valid Email";
                      } else {
                        data().dataupdate(database!, userid, Email, Password);
                       Navigator.pop(context);
                      }
                    });
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
