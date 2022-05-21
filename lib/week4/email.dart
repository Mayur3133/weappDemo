import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:url_launcher/url_launcher.dart';

import 'mailer.dart';

class email extends StatefulWidget {
  const email({Key? key}) : super(key: key);

  @override
  State<email> createState() => _emailState();
}

class _emailState extends State<email> {
  TextEditingController To = TextEditingController();
  TextEditingController sub = TextEditingController();
  TextEditingController write = TextEditingController();

  bool Tostatus = false;
  bool substatus = false;
  bool writestatus = false;

  String Toerror = "";
  String suberror = "";
  String writeerror = "";

  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: loading
            ? SingleChildScrollView(
                child: Container(
                padding: EdgeInsets.all(30),
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.only(top: 30, bottom: 20),
                    child: TextField(
                      controller: To,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {
                          if (value.isNotEmpty) Tostatus = false;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: 'TO',
                          errorText: Tostatus ? "$Toerror" : null,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: Icon(Icons.email_outlined)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: TextField(
                      controller: sub,
                      maxLines: 2,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        setState(() {
                          if (value.isNotEmpty) substatus = false;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Subject',
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Icon(
                            Icons.menu,
                          ),
                        ),
                        errorText: substatus ? "$suberror" : null,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: TextField(
                      controller: write,
                      maxLines: 10,
                      keyboardType: TextInputType.text,
                      onChanged: (value) {
                        setState(() {
                          if (value.isNotEmpty) writestatus = false;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: 'Compose Mail',
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(bottom: 180),
                          child: Icon(
                            Icons.message,
                          ),
                        ),
                        errorText: writestatus ? "$writeerror" : null,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            String TO = To.text;
                            String SUB = sub.text;
                            String WRITE = write.text;

                            if (TO.isEmpty && SUB.isEmpty && WRITE.isEmpty) {
                              Tostatus = true;
                              Toerror = "Please enter EmailId";
                              substatus = true;
                              suberror = "Please enter Subject";
                              writestatus = true;
                              writeerror = "Please Write Something";
                            } else {
                              pqr(To.text, sub.text, write.text);
                            }
                          });
                        },
                        child: Text("Send")),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            String TO = To.text;
                            String SUB = sub.text;
                            String WRITE = write.text;

                            if (TO.isEmpty && SUB.isEmpty && WRITE.isEmpty) {
                              Tostatus = true;
                              Toerror = "Please enter EmailId";
                              substatus = true;
                              suberror = "Please enter Subject";
                              writestatus = true;
                              writeerror = "Please Write Something";
                            } else {
                              sendEmail();
                            }
                          });
                        },
                        child: Text("Send")),
                  ),
                ]),
              ))
            : Center(
                child: CircularProgressIndicator(),
              ));
  }

  void pqr(String text, String text2, String text3) {
    var mail = 'mailto:${text}?subject=${text2}&body=${text3}';
    launch(mail);
  }

  Future sendEmail() async {
    setState(() {
      loading = false;
    });
    final user = await GoogleAuthApi.signIn();
    setState(() {
      loading = true;
    });

    if (user == null) return;
    final email = user.email;
    final auth = await user.authentication;
    final token = auth.accessToken!;

    GoogleAuthApi.signout();

    final smtpServer = gmailSaslXoauth2(email, token);

    final message = Message()
      ..from = Address(email, 'Mayur Parmar')
      ..recipients = [To.text]
      ..subject = sub.text
      ..text = write.text;

    try {
      await send(message, smtpServer);

      Fluttertoast.showToast(msg: 'succesful');
      To.clear();
      sub.clear();
      write.clear();
    } on MailerException catch (e) {
      print(e);
    }
  }
}

class GoogleAuthApi {
  static final _googlesignin =
      GoogleSignIn(scopes: ['https://mail.google.com/']);

  static Future<GoogleSignInAccount?> signIn() async {
    if (await _googlesignin.isSignedIn()) {
      return _googlesignin.currentUser;
    } else {
      return await _googlesignin.signIn();
    }
  }

  static Future signout() => _googlesignin.signOut();
}
