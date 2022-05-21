import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class actionsheet extends StatefulWidget {
  @override
  _actionsheetState createState() => _actionsheetState();
}

class _actionsheetState extends State<actionsheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CupertinoActionSheet"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 300,
                          child: Column(
                            children: [
                              ListTile(
                                title: Text("Click here",textAlign: TextAlign.center,style: TextStyle(color: Colors.blue)),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Divider(
                                height: 2,
                              ),
                              ListTile(
                                title: Text("Click here",textAlign: TextAlign.center,style: TextStyle(color: Colors.blue)),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Divider(
                                height: 2,
                              ),
                              ListTile(
                                title: Text("Click here",textAlign: TextAlign.center,style: TextStyle(color: Colors.blue)),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Divider(
                                height: 2,
                              ),
                              ListTile(
                                title: Text("Click here",textAlign: TextAlign.center,style: TextStyle(color: Colors.blue)),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              Divider(
                                height: 2,
                              ),
                              ListTile(
                                title: Text("Cancel",textAlign: TextAlign.center,style: TextStyle(color: Colors.blue)),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ),
                        );
                      });
                },
                child: Text("ANDROID")),
            ElevatedButton(
              onPressed: () {
                final action = CupertinoActionSheet(
                  title: Text(
                    "Click ",
                    style: TextStyle(fontSize: 30),
                  ),
                  message: Text(
                    "Select action ",
                    style: TextStyle(fontSize: 15.0),
                  ),
                  actions:[
                    CupertinoActionSheetAction(
                      child: Text("Action 1"),
                      //isDefaultAction: true,
                      onPressed: () {
                        Navigator.pop(context);
                        Fluttertoast.showToast(msg: 'Action 1');
                      },
                    ),
                    CupertinoActionSheetAction(
                      child: Text("Action 2"),
                     // isDestructiveAction: true,
                      onPressed: () {
                        Navigator.pop(context);

                        Fluttertoast.showToast(msg: 'Action 2');
                      },
                    )
                  ],
                  cancelButton: CupertinoActionSheetAction(
                    child: Text("Cancel"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                );

                showCupertinoModalPopup(
                    context: context, builder: (context) => action);
              },
              child: Text("IOS"),
            ),
          ],
        ),
      ),
    );
  }


}
