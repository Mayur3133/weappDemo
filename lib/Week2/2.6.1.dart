import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertask/Week2/Biriyani.dart';
import 'package:fluttertask/Week2/burger.dart';
import 'package:fluttertask/Week2/chinese.dart';
import 'package:fluttertask/Week2/dosa.dart';
import 'package:fluttertask/Week2/pizza.dart';
import 'package:fluttertask/Week2/punjabi.dart';
import 'package:fluttertask/Week2/sandwich.dart';

import 'all.dart';

class order extends StatefulWidget {
  const order({Key? key}) : super(key: key);

  @override
  State<order> createState() => _orderState();
}

class _orderState extends State<order> {
  List fname = [
    'All',
    'Biriyani',
    'Dosa',
    'Chinese',
    'Pizza',
    'Burger',
    'Punjabi',
    'Sandwich'
  ];

  List pg = [
    all().toString(),
    biriyani().toString(),
    dosa().toString(),
    chinese().toString(),
    pizza().toString(),
    burger().toString(),
    punjabi().toString(),
    sandwich().toString()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Row(
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Icon(Icons.location_on_rounded,
                            color: Colors.red, size: 30),
                      ),
                      Container(
                        child: Text(
                          "Golf Cours Road",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.black26,
                  ))),
                ),
                Container(
                  margin: EdgeInsets.only(left: 150),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('image/pf.jpg'),
                      )),
                )
              ],
            ),
            Container(
              height: 62,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.white,
                    Colors.white,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 1,
                      color: Colors.grey.shade200,
                      blurRadius: 5,
                      offset: Offset(0, 6))
                ],
              ),
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                        Icon(Icons.search, size: 30, color: Colors.redAccent),
                  ),
                  Text(
                    'Restaurant name,cuisine or a dish',
                    style: TextStyle(color: Colors.black26),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                    ),
                    child: VerticalDivider(
                      color: Colors.black12,
                      endIndent: 8,
                      indent: 8,
                      thickness: 2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Icon(
                      Icons.align_horizontal_left,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            DefaultTabController(
                length: 8, // length of tabs
                initialIndex: 0,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        child: TabBar(
                          indicatorColor: Colors.black,
                          isScrollable: true,
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.grey,
                          padding: EdgeInsets.only(left: 10, bottom: 5),
                          tabs: [
                            Tab(text: 'All'),
                            Tab(text: 'Biriyani'),
                            Tab(text: 'Dosa'),
                            Tab(text: 'chinese'),
                            Tab(text: 'Pizza'),
                            Tab(text: 'Burger'),
                            Tab(text: 'Punjabi'),
                            Tab(text: 'Sandwich'),
                          ],
                        ),
                      ),
                      Container(
                          height: 570, //height of TabBarView
                          child: TabBarView(children: <Widget>[
                            all(),
                            Container(
                              child: Center(
                                child: Text('Biriyani'),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Text(
                                  'Dosa',
                                ),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Text(
                                  'chinese',
                                ),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Text(
                                  'Pizza',
                                ),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Text(
                                  'Burger',
                                ),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Text(
                                  'Punjabi',
                                ),
                              ),
                            ),
                            Container(
                              child: Center(
                                child: Text(
                                  'Sandwich',
                                ),
                              ),
                            ),
                          ]))
                    ])),
          ],
        )),
      ),
    );
  }
}
