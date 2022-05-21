import 'package:flutter/material.dart';

import 'Week8/animation/animation.dart';
import 'Week8/actionsheet.dart';
import 'Week8/animation/animation2.dart';
import 'Week8/lacalization.dart';
import 'Week8/logo.dart';
import 'Week8/popover.dart';
import 'Week8/responsiveapp.dart';

class week8 extends StatefulWidget {
  const week8({Key? key}) : super(key: key);

  @override
  State<week8> createState() => _week8State();
}

class _week8State extends State<week8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Week-8"),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 100, vertical: 50),
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return animhome();
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
                      'Animation ',
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
                    return actionsheet();
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
                      'Action sheet',
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
                    return PopoverExample();
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
                      'Popover',
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
                    return rspapp();
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
                      'Responsive Ui',
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
                    return logo();
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
                      'logo',
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
                      'Localization',
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
