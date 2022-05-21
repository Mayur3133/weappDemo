import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class forgot extends StatefulWidget {
  const forgot({Key? key}) : super(key: key);

  @override
  State<forgot> createState() => _forgotState();
}

class _forgotState extends State<forgot> {
  TextEditingController temail = TextEditingController();
  bool estatus = false;
  String emailerror = "";

  @override
  void dispose() {
    temail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: TextField(
                controller: temail,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.black, fontSize: 15),
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) {
                      estatus = false;
                    }
                  });
                },
                decoration: InputDecoration(
                  labelText: "Email or Username",
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorText: estatus ? "$emailerror" : null,
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  resetpassword();
                },
                child: Text("Send"))
          ],
        ),
      ),
    );
  }

  Future<void> resetpassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: temail.text.trim());
      // Navigator.popUntil(context, (route) => route.isFirst);
      SnackBar(content: Text("Email sent"));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('user not found');
        // SnackBar(content: Text(e.message!));

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.black54,
            content: Text(
              'user not found',
              style: TextStyle(fontSize: 18.0, color: Colors.white60),
            ),
          ),
        );
      }
    }
  }

  Widget indicator() {
    return CircularProgressIndicator();
  }
}
