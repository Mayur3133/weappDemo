import 'package:flutter/material.dart';
import 'package:fluttertask/week9-10/crashlytics/crashlytics.dart';
import 'package:fluttertask/week9-10/dynamiclink/analytics.dart';
import 'package:fluttertask/week9-10/dynamiclink/dynamiclink.dart';
import 'package:fluttertask/week9-10/email%20password%20auth/loginpage.dart';
import 'package:fluttertask/week9-10/firestore/firestore.dart';
import 'package:fluttertask/week9-10/rdbms/rdbms.dart';

import 'week9-10/Push notification/local notification.dart';
import 'week9-10/Push notification/push notification.dart';

class week9 extends StatefulWidget {
  const week9({Key? key}) : super(key: key);

  @override
  State<week9> createState() => _week9State();
}

class _week9State extends State<week9> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("week-9-10")),
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
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
                      'Firebase Auth',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return addemp();
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
                      'RDBMS',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return firestr();
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
                      'Fire store',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return localnoti();
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
                      'LocalNotification',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            // InkWell(
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(
            //       builder: (context) {
            //         return MyHomePage(
            //           title: '',
            //         );
            //       },
            //     ));
            //   },
            //   child: Container(
            //     margin: EdgeInsets.only(bottom: 15),
            //     height: 130,
            //     //width: double.infinity,
            //     child: Card(
            //       elevation: 30,
            //       color: Colors.black54,
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(10)),
            //       child: Center(
            //         child: Text(
            //           'pushNotification',
            //           style: TextStyle(fontSize: 20, color: Colors.white),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return crash();
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
                      'Crashlytics',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return dynamiclink();
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
                      'Dynamiclinks',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return customlink();
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
                      'customlink',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return Container();
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
                      'Analytics',
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
