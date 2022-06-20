import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/week9-10/email%20password%20auth/forgotpass.dart';
import 'package:fluttertask/week9-10/email%20password%20auth/registerpage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController temail = TextEditingController();
  TextEditingController tpassword = TextEditingController();

  bool estatus = false;
  bool pstatus = false;
  bool showpass = true;

  String emailerror = "";
  String passworderror = "";
  bool isloading = false;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: isloading
          ? Center(child: CircularProgressIndicator())
          : Container(
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //     colors: [Colors.blue.shade50, Colors.blueAccent.shade100],
              //     begin: FractionalOffset(0.0,1.8),
              //     end: FractionalOffset(1.8,0.0),
              //     tileMode: TileMode.clamp,
              //   ),
              // ),
              child: ListView(
                padding: EdgeInsets.only(top: 160, left: 20, right: 20),
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: TextField(
                      controller: temail,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      onChanged: (value) {
                        setState(() {
                          if (value.isNotEmpty) {
                            estatus = false;
                          }
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Username",
                        labelStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        errorText: estatus ? "$emailerror" : null,
                      ),
                    ),
                  ),
                  Container(
                    // alignment: Alignment.center,
                    // height: 50,
                    margin: EdgeInsets.only(top: 25),

                    child: TextField(
                      controller: tpassword,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: showpass,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      onChanged: (value) {
                        setState(() {
                          if (value.isNotEmpty) {
                            pstatus = false;
                          }
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Enter Your Password",
                        labelStyle: TextStyle(color: Colors.grey),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              showpass = !showpass;
                            });
                          },
                          icon: Icon(
                            showpass
                                ? Icons.remove_red_eye_outlined
                                : Icons.visibility_off,
                          ),
                        ),
                        errorText: pstatus ? "$passworderror" : null,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10, left: 90, right: 90),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlue,
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(20),
                        // ),
                      ),
                      onPressed: () {
                        setState(() {
                          String email = temail.text;
                          String password = tpassword.text;

                          bool emaValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(email);

                          if (email.isEmpty && password.isEmpty) {
                            estatus = true;
                            emailerror = "please enter Email";
                            pstatus = true;
                            passworderror = "enter Passoword";
                          } else if (email.isEmpty) {
                            estatus = true;
                            emailerror = "please enter Email";
                          } else if (password.isEmpty) {
                            pstatus = true;
                            passworderror = "enter Passoword";
                          } else if (!emaValid) {
                            estatus = true;
                            emailerror = "please enter valid Email";
                          } else {
                            usersignin();
                          }
                        });
                      },
                      child: Text(
                        "  LOGIN  ",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 10, left: 90, right: 90, bottom: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlue,
                        // shape: RoundedRectangleBorder(
                        //   borderRadius: BorderRadius.circular(20),
                        // ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return SignUpScreen();
                          },
                        ));
                      },
                      child: Text(
                        "  Sign Up  ",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Text("Forgot Password",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                            fontSize: 20)),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => forgot(),
                        )),
                  )
                ],
              ),
            ),
    );
  }

  Future<void> usersignin() async {
    try {
      FirebaseAnalytics.instance.logEvent(name: 'login');
      setState(() {
        isloading = true;
      });
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: temail.text,
        password: tpassword.text,
      );
      setState(() {
        isloading = false;
      });
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return success();
        },
      ));
      print('success');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          isloading = false;
        });
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        setState(() {
          isloading = false;
        });
        print('Wrong password provided for that user.');
      }
    }
  }
}

class success extends StatelessWidget {
  const success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text("Success"),
      ),
    );
  }
}
