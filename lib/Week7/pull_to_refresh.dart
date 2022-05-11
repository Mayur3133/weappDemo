import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  ref() {
    if (mounted) {
      setState(() {});
    }
  }

  final String apiUrl = "https://randomuser.me/api/?results=1000";

  List userdata = [];

  void getuser() async {
    var result = await http.get(Uri.parse(apiUrl));
    userdata = json.decode(result.body)['results'];
    ref();
  }

  name(userdata) {
    return userdata['name']['title'] +
        " " +
        userdata['name']['first'] +
        " " +
        userdata['name']['last'];
  }

  username(userdata) {
    return userdata['login']['username'];
  }

  @override
  void initState() {
    super.initState();
    getuser();
  }

  Future getData() async {
    getuser();
    ref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pull to refresh'),
      ),
      body: Center(
        child: userdata.length != 0
            ? Container(
                child: RefreshIndicator(
                  child: ListView.builder(
                      padding: EdgeInsets.all(8),
                      itemCount: userdata.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        userdata[index]['picture']['large'])),
                                title: Text(name(userdata[index])),
                                subtitle: Text(username(userdata[index])),
                              )
                            ],
                          ),
                        );
                      }),
                  onRefresh: getData,
                ),
              )
            : CircularProgressIndicator(),
      ),
    );
  }
}
