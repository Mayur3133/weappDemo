import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/Week2/2.6.1.dart';
import 'package:fluttertask/Week2/2.6.2.dart';
import 'package:fluttertask/Week2/2.6.3.dart';
import 'package:fluttertask/Week2/2.6.4.dart';
import 'package:fluttertask/Week2/2.6.5.dart';

class layout extends StatefulWidget {
  const layout({Key? key}) : super(key: key);

  @override
  State<layout> createState() => _layoutState();
}

class _layoutState extends State<layout> {
  final pages = [
    order(),
    goout(),
    pro(),
    nutrition(),
    donate(),
  ];
  int curntind = 0;

  void onTabTapped(int index) {
    setState(() {
      curntind = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [pages.elementAt(curntind)],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: curntind,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: 'Order'),
          BottomNavigationBarItem(
              icon: Icon(Icons.directions_walk_sharp), label: 'Go Out'),
          BottomNavigationBarItem(icon: Icon(Icons.whatshot), label: 'Pro'),
          BottomNavigationBarItem(
              icon: Icon(Icons.volunteer_activism), label: 'Nutrition'),
          BottomNavigationBarItem(
              icon: Icon(Icons.clean_hands), label: 'Donate'),
        ],
      ),
    );
  }
}
