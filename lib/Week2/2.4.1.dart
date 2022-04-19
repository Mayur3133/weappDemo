import 'package:flutter/material.dart';
import 'package:fluttertask/Week2/2.4.viewcnt.dart';

class viewc extends StatefulWidget {
  String password = '';
  String email = '';

  Function(String, String) edit;

  viewc(
      {Key? key,
      required this.password,
      required this.email,
      required this.edit})
      : super(key: key);

  @override
  State<viewc> createState() => _viewcState();
}

class _viewcState extends State<viewc> {
  TextEditingController temail = TextEditingController();
  TextEditingController tpassword = TextEditingController();

  bool emailstatus = false;
  bool passwordststus = false;

  String emailerror = "";
  String passworderror = "";

  @override
  void initState() {
    // TODO: implement initState
    temail.text = widget.email;
    tpassword.text = widget.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit"),
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
                  if (value.isNotEmpty) {
                    emailstatus = false;
                  }
                });
              },
              decoration: InputDecoration(
                  label: Text('Email'),
                  errorText: emailstatus ? "$emailerror" : null,

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
                  if (value.isNotEmpty) passwordststus = false;
                });
              },
              decoration: InputDecoration(
                  label: Text('Password'),
                  errorText: passwordststus ? "$passworderror" : null,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 150, right: 150),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  String mail = temail.text;
                  String pass = tpassword.text;

                  bool Validmail = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                      .hasMatch(mail);
                  if (mail.isEmpty && pass.isEmpty) {
                    emailstatus = true;
                    emailerror = "please enter Email";
                    passwordststus = true;
                    passworderror = "enter Passoword";
                  }    else if (pass.isEmpty) {
                    passwordststus = true;
                    passworderror = "enter Passoword";
                    }
                  else if(pass.isEmpty && !Validmail){
                    passwordststus = true;
                    passworderror = "enter Passoword";
                    emailstatus = true;
                    emailerror = "please enter valid Email";
                  }
                  else if (mail.isEmpty) {
                    emailstatus = true;
                    emailerror = "please enter Email";

                  } else if (!Validmail) {
                    emailstatus = true;
                    emailerror = "please enter valid Email";
                  }
                  else{
                    widget.edit(temail.text, tpassword.text);
                  Navigator.pop(context);}

                });
              },
              child: Text('Done'),
            ),
          ),
        ]),
      )),
    );
  }
}
