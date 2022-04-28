import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dash.dart';
import 'facebooklogin.dart';

class Googlelogin extends StatefulWidget {
  const Googlelogin({Key? key}) : super(key: key);

  @override
  State<Googlelogin> createState() => _GoogleloginState();
}

class _GoogleloginState extends State<Googlelogin> {
  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Social Media Login",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.black45,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      await FirebaseServices().signInWithGoogle();
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return const home();
                        },
                      ));
                    },
                    child: Container(
                      height: 100,
                      width: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.indigo,
                          image: DecorationImage(
                              image: AssetImage("image/glogo.jpg"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () async {
                      Navigator.pushReplacement(context, MaterialPageRoute(
                        builder: (context) {
                          return FaceBookLoginDemo();
                        },
                      ));
                    },
                    child: Container(
                      height: 100,
                      width: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.indigo,
                          image: DecorationImage(
                              image: AssetImage("image/fblogo.png"),
                              fit: BoxFit.cover)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
