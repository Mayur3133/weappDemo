import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class sms extends StatefulWidget {
  const sms({Key? key}) : super(key: key);

  @override
  State<sms> createState() => _smsState();
}

class _smsState extends State<sms> {
  TextEditingController tcall = TextEditingController();
  TextEditingController tsms = TextEditingController();
  bool callstatus = false;
  bool smsstatus = false;

  String callerror = "";
  String smserror = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 150),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(30),
              child: TextField(
                controller: tcall,
                keyboardType: TextInputType.phone,
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) callstatus = false;
                  });
                },
                decoration: InputDecoration(
                    errorText: callstatus ? "$callerror" : null,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    prefixIcon: Icon(Icons.call)),
              ),
            ),
            Container(
              margin: EdgeInsets.all(30),
              child: TextField(
                controller: tsms,
                maxLines: 5,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) smsstatus = false;
                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(bottom: 80),
                    child: Icon(
                      Icons.message,
                    ),
                  ),
                  errorText: smsstatus ? "$smserror" : null,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  //prefixIcon: Icon(Icons.)
                ),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    String Call = tcall.text;
                    String SMS = tsms.text;

                     if (Call.isEmpty && SMS.isEmpty) {
                      smsstatus = true;
                      smserror = "Please Write Something";
                      callstatus = true;
                      callerror = "Please enter Valid Number";
                    }
                   else if (Call.isEmpty || Call.length < 10 ) {
                      callstatus = true;
                      callerror = "Please enter Valid Number";
                    }
                    else
                    {
                      xyz(tcall.text, tsms.text);
                    }
                  });
                },
                child: Text('Send Message'))
          ],
        ),
      ),
    );
  }

  void xyz(String call, String sms) {
    var msg = 'sms:+91${call}?body=${sms}';
    launch(msg);
  }
}
