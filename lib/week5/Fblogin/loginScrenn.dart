import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'G_F_Controller.dart';

class G_F_Screen extends StatefulWidget {
  const G_F_Screen({Key? key}) : super(key: key);

  @override
  State<G_F_Screen> createState() => _G_F_ScreenState();
}

class _G_F_ScreenState extends State<G_F_Screen> {
  FGAuthControler _auth = Get.put(FGAuthControler());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // InkWell(
            //   onTap: _auth.googleAuth(),
            //   child: Container(
            //     height: 100,
            //     width: 60,
            //     decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: Colors.indigo,
            //         image: DecorationImage(
            //             image: AssetImage("image/glogo.jpg"),
            //             fit: BoxFit.cover)),
            //   ),
            // ),
            // InkWell(
            //   onTap:   _auth.facebookAuth(),
            //   child: Container(
            //     height: 100,
            //     width: 60,
            //     decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: Colors.indigo,
            //         image: DecorationImage(
            //             image: AssetImage("image/fblogo.png"),
            //             fit: BoxFit.cover)),
            //   ),
            // ),

            ElevatedButton.icon(
                onPressed: () {
                  _auth.googleAuth();
                },
                icon: Icon(
                  FontAwesomeIcons.google,
                  color: Colors.white,
                ),
                label: Text("Login With Google")),
            ElevatedButton.icon(
                onPressed: () {
                  _auth.facebookAuth();
                },
                icon: Icon(
                  FontAwesomeIcons.facebook,
                  color: Colors.white,
                ),
                label: Text("Login With Facebook")),
          ],
        ),
      ),
    );
  }
}
