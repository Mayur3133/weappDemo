import 'package:flutter/material.dart';
import 'package:fluttertask/week4/call.dart';
import 'package:fluttertask/week4/sms.dart';

import 'email.dart';

class cse extends StatefulWidget {
  const cse({Key? key}) : super(key: key);

  @override
  State<cse> createState() => _cseState();
}

class _cseState extends State<cse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return sms();
                    },
                  ));
                },
                child: Text("SMS")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => call(),
                      ));
                },
                child: Text("Call")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => email(),
                      ));
                },
                child: Text("Email")),

            // ElevatedButton(onPressed: () {
            //   Navigator.push(context, MaterialPageRoute(builder: (context) => dirmail(),));
            //
            // }, child: Text("Dir Email")),
          ],
        ),
      ),
    );
  }
}
