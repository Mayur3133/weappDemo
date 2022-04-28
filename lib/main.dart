import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/w1.dart';
import 'package:fluttertask/w2.dart';
import 'package:fluttertask/w3.dart';
import 'package:fluttertask/w4.dart';
import 'package:fluttertask/w5.dart';
import 'package:fluttertask/w6.dart';

void main() {
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
                        height: 130,
                        // width: double.infinity,
                        child: Card(
                          elevation: 30,
                          color: Colors.black54,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              '      Week-1      ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
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
                        //width: double.infinity,
                        child: Card(
                          elevation: 30,
                          color: Colors.black54,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              '      Week-2      ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
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
                        //width: double.infinity,
                        child: Card(
                          elevation: 30,
                          color: Colors.black54,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              '      Week-3      ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
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
                        //width: double.infinity,
                        child: Card(
                          elevation: 30,
                          color: Colors.black54,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              '      Week-4     ',
                              style:
                              TextStyle(fontSize: 20, color: Colors.white),
                            ),
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
                        //width: double.infinity,
                        child: Card(
                          elevation: 30,
                          color: Colors.black54,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              '      Week-5      ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
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
                        //width: double.infinity,
                        child: Card(
                          elevation: 30,
                          color: Colors.black54,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: Text(
                              '      Week-6     ',
                              style:
                              TextStyle(fontSize: 20, color: Colors.white),
                            ),
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
