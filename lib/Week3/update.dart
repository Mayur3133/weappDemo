import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class updata extends StatefulWidget {
  String userid;
  String name;
  String email;
  String profilepic;

  updata(this.userid, this.name, this.email, this.profilepic,);

  @override
  State<updata> createState() => _updataState();
}

class _updataState extends State<updata> {
  dataupdate(
      String name,
      String email,
      //  XFile image,
      ) async {
    var response = await http.put(
      Uri.parse("http://192.168.1.42/Practical_Api/api/edit_user_details"),
      headers: {
        "Token":
        "dyGyy4ST5P8:APA91bFDJ_X9qdRcWvdAnXxnrKXU0DlVUpGf5CQez4mLSn9y6vo0qQUslK2Zj2YLO2eEH-x7K6dyf40Ltd5aCGoNs9Kk2ZRx_oCb88D3l_53SVqjhdKlLKz0enqdtvxDN3K0lg_eISlc"
      },
      body: ({"user_id":widget.userid,"name": name, "email": email}),
    );
    if (response.statusCode == 200) {
      if (photo != null) {
        Map<String, String> uData = Map<String, String>();
        uData['user_id'] = widget.userid;
        await updateimage(photo!.path, uData);
      }
      else{
        Navigator.pop(context,true);
      }
    } else{
      print("Null...");
    }
  }

  TextEditingController tname = TextEditingController();
  TextEditingController temail = TextEditingController();

  bool namestatus = false;
  bool emailstatus = false;

  String nameerror = "";
  String emailerror = "";

  final ImagePicker _picker = ImagePicker();
  XFile? photo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tname.text = widget.name;
    temail.text = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ViewController"),
        ),
        body: ListView(
          padding: EdgeInsets.only(top: 80, left: 10, right: 10),
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: Text('Slect'),
                          children: [
                            ListTile(
                              title: Text('Camera'),
                              leading: Icon(Icons.camera),
                              onTap: () async {
                                photo = await _picker.pickImage(
                                    source: ImageSource.camera);
                                Navigator.pop(context);
                                setState(() {});
                              },
                            ),
                            ListTile(
                              title: Text('Gallery'),
                              leading: Icon(Icons.image),
                              onTap: () async {
                                photo = await _picker.pickImage(
                                    source: ImageSource.gallery);
                                Navigator.pop(context);
                                setState(() {});
                              },
                            )
                          ],
                        );
                      });
                });
              },
              child: CircleAvatar(
                radius: 60,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: photo != null
                            ? FileImage(File(photo!.path))
                            : NetworkImage(widget.profilepic) as ImageProvider,
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, bottom: 10, left: 10, right: 10),
              child: TextField(
                controller: tname,
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) namestatus = false;
                  });
                },
                decoration: InputDecoration(
                    label: Text('Name'),
                    errorText: namestatus ? "$nameerror" : null,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20, left: 10, right: 10),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                controller: temail,
                onChanged: (value) {
                  setState(() {
                    if (value.isNotEmpty) emailstatus = false;
                  });
                },
                decoration: InputDecoration(
                    label: Text('Email'),
                    errorText: emailstatus ? "$emailerror" : null,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 150, right: 150),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    String name = tname.text;
                    String email = temail.text;

                    bool emailValid = RegExp(
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                        .hasMatch(email);
                    if (name.isEmpty && email.isEmpty) {
                      namestatus = true;
                      nameerror = "please enter Name";
                      emailstatus = true;
                      emailerror = "enter Email";
                    } else if (name.isEmpty) {
                      namestatus = true;
                      nameerror = "please enter Name";
                    } else if (email.isEmpty) {
                      emailstatus = true;
                      emailerror = "enter Email";
                    } else if (!emailValid) {
                      emailstatus = true;
                      emailerror = "please enter valid Email";
                    } else {
                      dataupdate(name, email);
                    }
                    //Navigator.pop(context);
                    // dataupdate(name, email);
                  });
                },
                child: Text('Update'),
              ),
            )
          ],
        ));
  }

  updateimage(String path, Map<String, String> uData
      ) async {
    final response =await http.MultipartRequest(
      'POST',Uri.parse("http://192.168.1.42/Practical_Api/api/change_profile_pic"),
    );
    var headers={
      "Token":"dyGyy4ST5P8:APA91bFDJ_X9qdRcWvdAnXxnrKXU0DlVUpGf5CQez4mLSn9y6vo0qQUslK2Zj2YLO2eEH-x7K6dyf40Ltd5aCGoNs9Kk2ZRx_oCb88D3l_53SVqjhdKlLKz0enqdtvxDN3K0lg_eISlc"
    };
    response.headers.addAll(headers);
    response.fields.addAll(uData);
    response.files.add(await http.MultipartFile.fromPath('profile_pic', path));
    var req = await response.send();

    if (req.statusCode == 200) {
      Navigator.pop(context,true);
    }

  }
}
