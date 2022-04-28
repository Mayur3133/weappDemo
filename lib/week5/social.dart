import 'package:flutter/material.dart';
import 'package:fluttertask/week5/fblogin.dart';

class social extends StatefulWidget {
  const social({Key? key}) : super(key: key);

  @override
  State<social> createState() => _socialState();
}

class _socialState extends State<social> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 100,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.indigo,
                image: DecorationImage(image: AssetImage("image/glogo.jpg"),fit: BoxFit.cover)),
          ),
          SizedBox(width: 20),


          InkWell(onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>fblogin() ,));

          },
            child: Container(
              height: 100,
              width: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.indigo,
                  image: DecorationImage(image: AssetImage("image/fblogo.png"),fit: BoxFit.cover)),
            ),
          ),
        ]),
      ),
    );
  }
}
