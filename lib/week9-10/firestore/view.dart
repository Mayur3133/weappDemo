import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/Week3/update.dart';
import 'package:fluttertask/week6/fb_ads.dart';
import 'package:fluttertask/week9-10/firestore/update.dart';

class viewp extends StatefulWidget {
  const viewp({Key? key}) : super(key: key);

  @override
  State<viewp> createState() => _viewpState();
}

class _viewpState extends State<viewp> {
  // bool status = false;
  String St = 'Pending';

  CollectionReference firestore =
      FirebaseFirestore.instance.collection('users');
  final Stream<QuerySnapshot> collectionStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  late final String documentId;

  // GetUserName(this.documentId);

  Future<void> deleteUser(id) {
    return firestore
        .doc(id)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Firestore Database")),
      body: Center(
        child: StreamBuilder<QuerySnapshot>(
          stream: collectionStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                data['id'] = document.id;
                String date = data['createdate'];

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onDoubleTap: () async {
                      DateTime now = DateTime.now();
                      String doneDate =
                          DateFormat('MM-dd-yyyy').format(now);

                      if (data['status'] == "Pending") {
                        await firestore.doc(data['id']).update({
                          'donedate': doneDate,
                          'status': 'Done',
                        });
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey.shade400,
                            Colors.grey.shade100,
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                      "Status:${data['status']}   ${data['createdate']} "),
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
                                                      Navigator.pop(context);
                                                      Navigator.push(context,
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) {
                                                        return updatedatapage(
                                                            data['id'],
                                                            data['title'],
                                                            data['description']);
                                                      }));
                                                    },
                                                    child: Text("Update")),
                                                ElevatedButton(
                                                    onPressed: () async {
                                                      Navigator.pop(context);
                                                      deleteUser(data['id']);
                                                      setState(() {});
                                                    },
                                                    child: Text("Delete"))
                                              ],
                                            );
                                          });
                                    },
                                    icon: Icon(Icons.menu)),
                              ]),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Title: ${data['title'].toString()}",
                                      softWrap: true,
                                    ),
                                    Text(
                                      "Description: ${data['description'].toString()}",
                                      softWrap: true,
                                    ),
                                    Text(
                                        "Done_Date: ${data['donedate'].toString()}"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
