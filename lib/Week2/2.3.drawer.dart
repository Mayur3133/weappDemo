import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class drw extends StatefulWidget {
  const drw({Key? key}) : super(key: key);

  @override
  State<drw> createState() => _drwState();
}

class _drwState extends State<drw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer'),
      ),
      body: Center(
        child: Text(''),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.lightBlue,
                maxRadius: 50,
                backgroundImage:
                    NetworkImage('https://picsum.photos/250?image=9'),
              ),
              accountEmail: Text(
                'Mayurparmar1014@gmail.com',
                style: TextStyle(color: Colors.blue),
              ),
              accountName: Text(
                'Mayur Parmar',
                style: TextStyle(color: Colors.blue),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_balance),
              title: Text('Home'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => hm(),));
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.apps_sharp),
              title: Text('Details'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class hm extends StatefulWidget {
  const hm({Key? key}) : super(key: key);

  @override
  State<hm> createState() => _hmState();
}

class _hmState extends State<hm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 100,left: 100,right: 100),
            alignment: Alignment.center,
            child: Text("Hello"),
          ),
        ],
      ),
    );
  }
}
