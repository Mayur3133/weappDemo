import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertask/Week3/update.dart';
import 'package:http/http.dart' as http;

import 'Mydata.dart';
import 'adddata.dart';

class gdata extends StatefulWidget {
  const gdata({Key? key}) : super(key: key);

  @override
  State<gdata> createState() => _gdataState();
}

class _gdataState extends State<gdata> {
  Future<Mydata> getdata() async {
    final response = await http.get(
        Uri.parse("http://192.168.1.42/Practical_Api/api/get_user_list"),
        headers: {
          "Token":
              "dyGyy4ST5P8:APA91bFDJ_X9qdRcWvdAnXxnrKXU0DlVUpGf5CQez4mLSn9y6vo0qQUslK2Zj2YLO2eEH-x7K6dyf40Ltd5aCGoNs9Kk2ZRx_oCb88D3l_53SVqjhdKlLKz0enqdtvxDN3K0lg_eISlc"
        });
    print(response.body.toString());
    var abc = jsonDecode(response.body.toString());
    //  Mydata json = Mydata.fromJson(jsonDecode(response.body.toString()));
    if (response.statusCode == 200) {
      return Mydata.fromJson(abc);
    } else {
      return Mydata.fromJson(abc);
    }
    //print("user=${json.data?[1].name}");
  }

  Future delet(String uid) async {
    var dldata = await http.delete(
        Uri.parse("http://192.168.1.42/Practical_Api/api/delete_user"),
        headers: {
          "Token":
              "dyGyy4ST5P8:APA91bFDJ_X9qdRcWvdAnXxnrKXU0DlVUpGf5CQez4mLSn9y6vo0qQUslK2Zj2YLO2eEH-x7K6dyf40Ltd5aCGoNs9Kk2ZRx_oCb88D3l_53SVqjhdKlLKz0enqdtvxDN3K0lg_eISlc"
        },
        body: {
          "user_id": uid
        });
    if (dldata.statusCode == 200) {
      setState(() {
        getdata();
      });
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("DATA"),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async {
            var ref = await Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return additem();
              },
            ));
            if (ref = true)
              setState(() {
                getdata();
              });
          },
        ),
        body: FutureBuilder<Mydata>(
          future: getdata(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text("Loading.."),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text("Please Select"),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () async {
                                        Navigator.pop(context);
                                        var ref = await Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return updata(
                                            snapshot.data!.data![index].userId
                                                .toString(),
                                            snapshot.data!.data![index].name
                                                .toString(),
                                            snapshot.data!.data![index].email
                                                .toString(),
                                            snapshot
                                                .data!.data![index].profilePic
                                                .toString(),
                                          );
                                        }));
                                        if (ref = true) {
                                          setState(() {
                                            getdata();
                                          });
                                        }
                                      },
                                      child: Text("Update")),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        var Uid = snapshot
                                            .data!.data![index].userId
                                            .toString();
                                        delet(Uid);
                                        setState(() {});
                                      },
                                      child: Text("Delete"))
                                ],
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.menu)),
                    title: Text(snapshot.data!.data![index].name.toString()),
                    subtitle:
                        Text(snapshot.data!.data![index].email.toString()),
                  );
                },
              );
            }
          },
        ));
  }
}
