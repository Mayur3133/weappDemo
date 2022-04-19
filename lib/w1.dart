import 'package:flutter/material.dart';
import 'package:fluttertask/Week1/1.1.dart';
import 'package:fluttertask/Week1/1.2.dart';
import 'package:fluttertask/Week1/1.4.dart';
import 'package:fluttertask/Week1/1.3.dart';

class week1 extends StatefulWidget {
  const week1({Key? key}) : super(key: key);

  @override
  _week1State createState() => _week1State();
}

class _week1State extends State<week1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue,
        title: Text('week-1'),),
      body: Container(

        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 100,vertical: 50),
          children: [
            InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return flt();
              },));
            },
              child: Container(
                margin: EdgeInsets.only(bottom: 15),
                height: 130,
                //width: double.infinity,
                child:Card(
                  elevation: 30,
                  color: Colors.black54,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text('What is Flutter',style: TextStyle(fontSize: 20,color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return inst();
              },));
            },
              child: Container(
                margin: EdgeInsets.only(bottom: 15),
                height: 130,
                //width: double.infinity,
                child:Card(
                  elevation: 30,
                  color: Colors.black54,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text('Flutter Installation',style: TextStyle(fontSize: 20,color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return navi();
              },));
            },
              child: Container(
                margin: EdgeInsets.only(bottom: 15),
                height: 130,
                //width: double.infinity,
                child:Card(
                  elevation: 30,
                  color: Colors.black54,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text('Navigator',style: TextStyle(fontSize: 20,color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return cycle();
              },));
            },
              child: Container(
                margin: EdgeInsets.only(bottom: 15),
                height: 130,
                //width: double.infinity,
                child:Card(
                  elevation: 30,
                  color: Colors.black54,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text('AppCycle',style: TextStyle(fontSize: 20,color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
