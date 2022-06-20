import 'package:flutter/material.dart';
import 'package:fluttertask/Week7/Camera/camera.dart';

import 'Week7/in app purchase.dart';
import 'Week7/pull_to_refresh.dart';

class week7 extends StatefulWidget {
  const week7({Key? key}) : super(key: key);

  @override
  State<week7> createState() => _week7State();
}

class _week7State extends State<week7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("week-7")),
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return cam();
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
                      'Camera',
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
                    return UserList();
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
                      'Pull to refresh',
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
            //         return InApp();
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
            //           'In app Purchase',
            //           style: TextStyle(fontSize: 20, color: Colors.white),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),


            // InkWell(
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(
            //       builder: (context) {
            //         return paymentgtw();
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
            //           'Payment gateway',
            //           style: TextStyle(fontSize: 20, color: Colors.white),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
