import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertask/week12/user.dart';
import 'package:http/http.dart' as http;

class screen1 extends StatefulWidget {
  const screen1({Key? key}) : super(key: key);

  @override
  State<screen1> createState() => _screen1State();
}

class _screen1State extends State<screen1> {
  List _list = [];

  Future<void> getdetails() async {
    var rep =
        await http.get(Uri.parse("https://randomuser.me/api/?results=100"));
    setState(() {
      _list = json.decode(rep.body)['results'];
    });
    print("list $_list");

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => screen2(),
                    ));
                getdetails();
              },
              child: Text('Press'))
        ],
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: _list.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    height: 70,
                    child: Card(
                      color: Colors.blueGrey[200],
                      elevation: 5,
                      child: ListTile(
                        dense: true,
                        title: Text("${_list[index]['name']['first']}",
                            style: TextStyle(fontSize: 17)),
                        subtitle: Text(_list[index]['email'],
                            style: TextStyle(fontSize: 15)),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

class screen2 extends StatefulWidget {
  const screen2({Key? key}) : super(key: key);

  @override
  State<screen2> createState() => _screen2State();
}

class _screen2State extends State<screen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Go Back"))
        ],
      )),
    );
  }
}
