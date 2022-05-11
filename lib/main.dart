import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:fluttertask/w1.dart';
import 'package:fluttertask/w2.dart';
import 'package:fluttertask/w3.dart';
import 'package:fluttertask/w4.dart';
import 'package:fluttertask/w5.dart';
import 'package:fluttertask/w6.dart';
import 'package:fluttertask/w7.dart';

import 'W8.dart';

List<CameraDescription> cameras = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  Stripe.publishableKey =
      "pk_test_51KxjzaSCwVxg8MzfxvAXbttahWOqeYCRlc71pGCnhv0zyBR0CGZIDpqRVa0tDNFPkHa23WZzTsMnDnclMKnRs35E00USnYzX4q";
  // await Stripe.instance.applySettings();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: task(),
  ));
}

class task extends StatelessWidget {
  const task({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Task"),
      ),
      body: Container(
        //  decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF9ccc65),Color(0xFFc5E1A5)]),),
        child: ListView(
          padding: EdgeInsets.only(top: 25),
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return week1();
                          },
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black54,
                        ),
                        height: 130,
                        // width: double.infinity,
                        child: Center(
                          child: Text(
                            '      Week-1      ',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return week2();
                          },
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15),
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black54,
                        ),
                        //width: double.infinity,
                        child: Center(
                          child: Text(
                            '      Week-2      ',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return week3();
                          },
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15),
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black54,
                        ),
                        //width: double.infinity,
                        child: Center(
                          child: Text(
                            '      Week-3      ',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return week4();
                          },
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15),
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black54,
                        ),
                        //width: double.infinity,
                        child: Center(
                          child: Text(
                            '      Week-4     ',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return week5();
                          },
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15),
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black54,
                        ),
                        //width: double.infinity,
                        child: Center(
                          child: Text(
                            '      Week-5      ',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return week6();
                          },
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15),
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black54,
                        ),
                        //width: double.infinity,
                        child: Center(
                          child: Text(
                            '      Week-6     ',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return week7();
                          },
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15),
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black54,
                        ),
                        //width: double.infinity,
                        child: Center(
                          child: Text(
                            '      Week-7      ',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return week8();
                          },
                        ));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15),
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black54,
                        ),
                        //width: double.infinity,
                        child: Center(
                          child: Text(
                            '      Week-8     ',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
