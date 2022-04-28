import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'facebooklogin.dart';
import 'gogglelogin.dart';


class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.network(FirebaseAuth.instance.currentUser!.photoURL!,fit: BoxFit.cover,),
            SizedBox(
              height: 10,
            ),
            Text("${FirebaseAuth.instance.currentUser!.displayName}"),
            Text("${FirebaseAuth.instance.currentUser!.email}"),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text("Logout"),
              onPressed: () async {
                await FirebaseServices().googleSignOut();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Googlelogin()));
              },
            ),
          ],
        ),
      ),
    );
  }
}


class FirebaseServices {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
      await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        await _auth.signInWithCredential(authCredential);
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  googleSignOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
  //
  // Facebook(context) async {
  //   try {
  //     final result = await FacebookAuth.i.login(permissions: ['email']);
  //     if (result.status == LoginStatus.success) {
  //       final userdata = await FacebookAuth.i.getUserData();
  //       Navigator.pushReplacement(context, MaterialPageRoute(
  //         builder: (context) {
  //           return FaceBookLoginDemo();
  //         },
  //       ));
  //
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // Facebooklogout(BuildContext context) async {
  //   await FacebookAuth.i.logOut();
  //   Navigator.pop(context);
  }

