import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class call extends StatefulWidget {
  const call({Key? key}) : super(key: key);

  @override
  State<call> createState() => _callState();
}

class _callState extends State<call> {
  TextEditingController tcall = TextEditingController();
  bool callstatus = false;
  String callerror = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: tcall,
            keyboardType: TextInputType.phone,
            onChanged: (value) {
              setState(() {
                if (value.isNotEmpty) callstatus = false;
              });
            },
            decoration: InputDecoration(
                errorText: callstatus ? "$callerror" : null,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                prefixIcon: Icon(Icons.call)),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  String Call = tcall.text;
                  if (Call.isEmpty || Call.length < 10) {
                    callstatus = true;
                    callerror = "Please enter Valid Number";
                  } else {
                    abc(tcall.text);
                  }
                });
              },
              child: Text('Call'))
        ],
      ),
    );
  }

  abc(String text) {
    var cal = 'tel:+91${text}';
    launch(cal);
  }
}
