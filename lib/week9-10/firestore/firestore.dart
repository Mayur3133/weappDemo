import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/week9-10/firestore/view.dart';

class firestr extends StatefulWidget {
  const firestr({Key? key}) : super(key: key);

  @override
  State<firestr> createState() => _firestrState();
}

class _firestrState extends State<firestr> {
  CollectionReference firestore =
      FirebaseFirestore.instance.collection('users');

  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  bool titlestatus = false;
  bool descriptionstatus = false;

  String titleerror = "";
  String descriptionerror = "";

  // Future<void> addUser() {
  //   // Call the user's CollectionReference to add a new user
  //   return firestore
  //       .add({
  //     'title': title, // John Doe
  //     'description': description, // Stokes and Sons
  //
  //   })
  //       .then((value) => print("User Added"))
  //       .catchError((error) => print("Failed to add user: $error"));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: TextField(
                controller: title,
                maxLines: 1,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) titlestatus = false;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Title',
                  prefixIcon: Icon(
                    Icons.menu,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, left: 20, right: 20),
              child: TextField(
                controller: description,
                maxLines: 10,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  hintText: 'Description',
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(bottom: 180),
                    child: Icon(
                      Icons.message,
                    ),
                  ),
                  errorText: descriptionstatus ? "$descriptionerror" : null,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 40,
              padding: EdgeInsets.only(left: 110, right: 110),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    DateTime now= DateTime.now();
                    String ttitle = title.text;
                    String tdescription = description.text;
                    String createdate = DateFormat("MM--dd-yyyy ").format(now);

                    setState(() {
                      if (ttitle.isEmpty) {
                        titlestatus = true;
                        titleerror = "Please Enter title";
                      }
                      if (tdescription.isEmpty) {
                        descriptionstatus = true;
                        descriptionerror = "Please write description";
                      } else {
                        firestore.add({
                          'status':'Pending',
                          'title': title.text, // John Doe
                          'description': description.text,
                          'createdate':createdate.toString(),
                          'donedate':""
                        });
                        title.clear();
                        description.clear();
                        // Navigator.push(context, MaterialPageRoute(
                        //   builder: (context) {
                        //     return Container();
                        //   },
                        // ));
                      }
                    });
                  },
                  child: Text("Add")),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              height: 40,
              padding: EdgeInsets.only(left: 110, right: 110),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return viewp();
                      },
                    ));
                  },
                  child: Text("View")),
            ),
          ],
        ),
      ),
    );
  }
}
