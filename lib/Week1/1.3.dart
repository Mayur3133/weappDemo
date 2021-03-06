import 'package:flutter/material.dart';
import 'package:fluttertask/homepage.dart';
import 'package:fluttertask/main.dart';
import '1.3.1.dart';
import '1.3.2.dart';
import '1.3.4.dart';

class navi extends StatefulWidget {
  const navi({Key? key}) : super(key: key);

  @override
  _naviState createState() => _naviState();
}

class _naviState extends State<navi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Navigator'),
      ),
      body: Container(
        height: double.infinity,
        //   decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF9ccc65),Color(0xFFc5E1A5)]),),
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return secondpage();
                }));
              },
              child: Container(
                margin: EdgeInsets.only(top: 200, left: 70, right: 70),
                height: 100,
                //width: double.infinity,
                child: Card(
                  elevation: 30,
                  color: Colors.black54,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Go to Next page',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return third();
                }));
              },
              child: Container(
                margin: EdgeInsets.only(top: 20, left: 70, right: 70),
                height: 100,
                //width: double.infinity,
                child: Card(
                  elevation: 30,
                  color: Colors.black54,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'pushReplacement',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => newscn(),
                    ));
                // Navigator.pushAndRemoveUntil (context, MaterialPageRoute(builder:(context){
                //   return homepage();
                // }),(route) => false );
              },
              child: Container(
                margin: EdgeInsets.only(top: 20, left: 70, right: 70),
                height: 100,
                //width: double.infinity,
                child: Card(
                  elevation: 30,
                  color: Colors.black54,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'pushAndRemoveUntil',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => s1(),
                        settings: RouteSettings(name: "s1")));
                // Navigator.pushAndRemoveUntil (context, MaterialPageRoute(builder:(context){
                //   return homepage();
                // }),(route) => false );
              },
              child: Container(
                margin: EdgeInsets.only(top: 20, left: 70, right: 70),
                height: 100,
                //width: double.infinity,
                child: Card(
                  elevation: 30,
                  color: Colors.black54,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Pop Until',
                      style: TextStyle(fontSize: 20, color: Colors.white),
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

class newscn extends StatelessWidget {
  const newscn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) {
                return navi();
              }), (route) => false);
            },
            child: Text("Click")),
      ),
    );
  }
 }
