// import 'dart:convert';
//
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:flutter/material.dart';
//
// class viewdata extends StatefulWidget {
//   const viewdata({Key? key}) : super(key: key);
//
//   @override
//   State<viewdata> createState() => _viewdataState();
// }
//
// class _viewdataState extends State<viewdata> {
//   final databaseref = FirebaseDatabase.instance.reference().child('Employe');
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: FirebaseAnimatedList(
//         defaultChild: Center(child: CircularProgressIndicator()),
//         query: databaseref,
//         shrinkWrap: true,
//         physics: NeverScrollableScrollPhysics(),
//         itemBuilder: (context, snapshot, animation, index) {
//           final mapp = Map.from(json.decode(json.encode(snapshot.value)));
//           print(mapp['name']);
//
//           return Container(
//             height: 100,
//             width: 200,
//             color: Colors.grey,
//             // decoration: BoxDecoration(
//             //     borderRadius: BorderRadius.circular(20),
//             //     color: Colors.grey),
//             // child: Text("${mapp['name']}"),
//           );
//         },
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/week9-10/rdbms/updatedata.dart';

class viewdata extends StatefulWidget {
  const viewdata({Key? key}) : super(key: key);

  @override
  State<viewdata> createState() => _viewdataState();
}

class _viewdataState extends State<viewdata> {
  final databaseRef =
      FirebaseDatabase.instance.reference().child("Employe").child('Employe');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "View RealTime Data",
        ),
      ),
      body: FirebaseAnimatedList(
        defaultChild: Center(
          child: CircularProgressIndicator(
            color: Colors.grey,
          ),
        ),
        query: databaseRef,
        shrinkWrap: true,
        itemBuilder: (context, DataSnapshot snapshot, animation, index) {
          final a = Map.from(json.decode(json.encode(snapshot.value)));

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: double.infinity,
              height: 210,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Colors.grey.shade200,
                    Colors.grey.shade100,
                  ],
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage("image/user.jpg"),
                        ),
                        IconButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      // title: Text("${lst[index]['email']}"),
                                      content: Text("please select"),
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () async {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Updatedata(),
                                                  ));
                                            },
                                            child: Text("Update")),
                                        ElevatedButton(
                                            onPressed: () async {
                                              databaseRef
                                                  .child(snapshot.key!)
                                                  .remove();

                                              Navigator.pop(context);

                                              setState(() {});
                                            },
                                            child: Text("Delete"))
                                      ],
                                    );
                                  });
                            },
                            icon: Icon(Icons.menu)),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 35, right: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text("${a['Name'].toString()}"),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 35, right: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text("${a['email'].toString()}"),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 35, right: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text("${a['gender'].toString()}"),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 35, right: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text("${a['contact'].toString()}"),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 10.0, left: 35, right: 10),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Text("${a['salary'].toString()}"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
