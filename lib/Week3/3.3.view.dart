import 'package:flutter/material.dart';
import 'package:fluttertask/Week3/3.3update.dart';
import 'package:sqflite/sqflite.dart';

import '3.3.db.dart';

class viewpage extends StatefulWidget {
  const viewpage({Key? key}) : super(key: key);

  @override
  State<viewpage> createState() => _viewpageState();
}

class _viewpageState extends State<viewpage> {
  Database? database;
  data mydata = data();
  List<Map> lst = [];

  Future<List<Map>> getdata() async {
    await mydata.dbs().then((value) async {
      database = value;
      await mydata.viewdata(database!).then((value1) {
        lst = value1;
        print(lst);
      });
    });
    return lst;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('View')),
      body: FutureBuilder(
        future: getdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: lst.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text("${lst[index]['email']}"),
                    subtitle: Text("${lst[index]['password']}"),
                    trailing: IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  // title: Text("${lst[index]['email']}"),
                                  content: Text("please select"),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () {

                                          Navigator.pop(context);
                                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                                            return upd(lst[index]);
                                          },));
                                        },
                                        child: Text("Update")),
                                    ElevatedButton(
                                        onPressed: () async {
                                          Navigator.pop(context);
                                          int userid = lst[index]['id'];
                                          await mydata.deleteUser(
                                              database!, userid);
                                          setState(() {});
                                        },
                                        child: Text("Delete"))
                                  ],
                                );
                              });
                        },
                        icon: Icon(Icons.menu)),
                  );
                },
              );
            } else {
              return Center(
                child: Text('NO Data'),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
