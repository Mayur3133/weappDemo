import 'package:flutter/material.dart';
import 'package:fluttertask/week11/getx.dart';
import 'package:fluttertask/week11/sliver.dart';

import 'week11/savefile.dart';

class week11 extends StatefulWidget {
  const week11({Key? key}) : super(key: key);

  @override
  State<week11> createState() => _week11State();
}

class _week11State extends State<week11> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("week-11")),
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
          children: [
            // InkWell(
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(
            //       builder: (context) {
            //         return getx();
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
            //           'GetX',
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
                    return sliver();
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
                      'Flutter sliver',
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
                    return FileOperationsScreen();
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
                      'Save file',
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
