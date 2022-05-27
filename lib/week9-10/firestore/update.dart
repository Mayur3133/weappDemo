import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/week9-10/firestore/view.dart';

class updatedatapage extends StatefulWidget {
  String id;
  String title;
  String description;

  updatedatapage(
    this.id,
    this.title,
    this.description,
  );

  @override
  State<updatedatapage> createState() => _updatedatapageState();
}

class _updatedatapageState extends State<updatedatapage> {
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

  bool titlestatus = false;
  bool descriptionstatus = false;

  String titleerror = "";
  String descriptionerror = "";
  var id;
  CollectionReference firestore =
      FirebaseFirestore.instance.collection('users');

  @override
  void initState() {
    id = widget.id;
    title.text = widget.title;
    description.text = widget.description;
    super.initState();
  }

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
                    String ttitle = title.text;
                    String tdescription = description.text;
                    setState(() {

                      if (ttitle.isEmpty) {
                        titlestatus = true;
                        titleerror = "Please Enter title";
                      }
                      if (tdescription.isEmpty) {
                        descriptionstatus = true;
                        descriptionerror = "Please write description";
                      } else {
                        firestore.doc(id).update({
                          'title': title.text, // John Doe
                          'description': description.text,
                        }).then((value) => 'success');
                      }
                      Navigator.pop(context);
                    });
                  },
                  child: Text("Save")),
            ),

          ],
        ),
      ),
    );
  }
}
