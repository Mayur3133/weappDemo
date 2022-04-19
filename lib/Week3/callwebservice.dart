import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'getjson.dart';

class call extends StatefulWidget {
  const call({Key? key}) : super(key: key);

  @override
  State<call> createState() => _callState();
}

class _callState extends State<call> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  bool namestatus = false;
  bool emailstatus = false;

  String nameerror = '';
  String emailerror = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchPosts();
  }

  fetchPosts() async {
    final response = await http.get(
        Uri.parse("http://192.168.1.14/Practical_Api/api/get_user_list"),
        headers: {
          "Token":
              "dyGyy4ST5P8:APA91bFDJ_X9qdRcWvdAnXxnrKXU0DlVUpGf5CQez4mLSn9y6vo0qQUslK2Zj2YLO2eEH-x7K6dyf40Ltd5aCGoNs9Kk2ZRx_oCb88D3l_53SVqjhdKlLKz0enqdtvxDN3K0lg_eISlc"
        });
    print(response.body);

    Getjson json = Getjson.fromJson(jsonDecode(response.body));
    print("User=${json.data?[0].email}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Api'),
        ),
        body: Container());
  }
}

// Container(
//   margin: EdgeInsets.all(20),
//   child: TextField(
//       controller: name,
//       onChanged: (value) {
//         setState(() {
//           if (value.isNotEmpty) namestatus = false;
//         });
//       },
//       decoration: InputDecoration(
//           hintText: 'Name',
//           errorText: namestatus ? "$nameerror" : null,
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10)))),
// ),
// Container(
//   margin: EdgeInsets.all(20),
//   child: TextField(
//     controller: email,
//     onChanged: (value) {
//       setState(() {
//         if (value.isNotEmpty) emailstatus = false;
//       });
//     },
//     decoration: InputDecoration(
//         hintText: 'Email',
//         errorText: emailstatus ? "$emailerror" : null,
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10))),
//   ),
// ),
// ElevatedButton(
//     onPressed: () {
//       setState(() {
//         String Email = email.text;
//         String Password = email.text;
//
//         bool emailValid = RegExp(
//                 r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
//             .hasMatch(Email);
//         if (Email.isEmpty && Password.isEmpty) {
//           namestatus = true;
//           nameerror = "please enter Name";
//           emailstatus = true;
//           emailerror = "enter Email";
//         } else if (Email.isEmpty) {
//           namestatus = true;
//           nameerror = "please enter Name";
//         } else if (Password.isEmpty) {
//           emailstatus = true;
//           emailerror = "enter Email";
//         } else if (!emailValid) {
//           emailstatus = true;
//           emailerror = "please enter valid Email";
//         } else {
//           name.text = "";
//           email.text = "";
//           Navigator.push(context, MaterialPageRoute(
//             builder: (context) {
//               return viepage();
//             },
//           ));
//         }
//       });
//     },
//     child: Text('Submit')),
