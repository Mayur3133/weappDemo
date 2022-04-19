import 'package:flutter/material.dart';
import 'package:fluttertask/Week2/2.1.2.dart';
import 'package:fluttertask/Week2/2.1.3.dart';
import 'package:fluttertask/Week2/2.1.4.dart';

import '2.1.1.dart';
import '2.1.5.dart';
import '2.1.6.dart';

class tabbar extends StatefulWidget {
  const tabbar({Key? key}) : super(key: key);

  @override
  _fltState createState() => _fltState();
}

class _fltState extends State<tabbar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('TabBar'),
          bottom: TabBar(
            //indicatorColor: Colors.amber,
            isScrollable: true,
            indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.lightBlue),
            tabs: [
              Tab(
                  icon: Icon(
                    Icons.person,
                    size: 25,
                  ),
                  text: "Profile"),
              Tab(
                  icon: Icon(
                    Icons.account_balance,
                    size: 25,
                  ),
                  text: "Home"),
              Tab(
                  icon: Icon(
                    Icons.build,
                    size: 25,
                  ),
                  text: "Settings"),
              Tab(
                  icon: Icon(
                    Icons.account_circle,
                    size: 25,
                  ),
                  text: "Account"),
              Tab(
                  icon: Icon(
                    Icons.apps_sharp,
                    size: 25,
                  ),
                  text: "Details"),
              Tab(
                  icon: Icon(
                    Icons.add_call,
                    size: 25,
                  ),
                  text: "CallDetails"),
            ],
          ),
        ),
        body: TabBarView(children: [
          firsttab(),
          secondtab(),
          thirdtab(),
          fourtab(),
          fivetab(),
          sixtab(),
        ]),
      ),
    );
  }
}
