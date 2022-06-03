import 'package:flutter/material.dart';
import 'package:fluttertask/w1.dart';
import 'package:fluttertask/w11.dart';
import 'package:fluttertask/w2.dart';
import 'package:fluttertask/w3.dart';
import 'package:fluttertask/w4.dart';
import 'package:fluttertask/w5.dart';
import 'package:fluttertask/w6.dart';
import 'package:fluttertask/w7.dart';
import 'package:fluttertask/w8.dart';
import 'package:fluttertask/w9.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return week9();
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
                            '      Week-9      ',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return week11();
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
                            '     Week-11    ',
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


