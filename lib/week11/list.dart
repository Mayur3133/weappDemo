import 'package:flutter/material.dart';
import 'package:fluttertask/week11/savefile.dart';

List listFiles = List.empty(growable: true);

class lst extends StatefulWidget {
  const lst({Key? key}) : super(key: key);

  @override
  State<lst> createState() => _lstState();
}

class _lstState extends State<lst> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FileUtils.getFiles().then((value) => {
          setState(() {
            listFiles = value;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Get File")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: listFiles.length,
              itemBuilder: (context, index) {
                String dt = '';
                String path = listFiles[index].path;
                String file_name = path.substring(path.lastIndexOf("/") + 1);
                FileUtils.readFromFile(file_name).then(
                  (contents) {
                    // setState(() {
                    //
                    // });
                    dt = contents;
                  },
                );
                return Card(
                  elevation: 0,
                  margin: EdgeInsets.all(1),
                  child: ListTile(
                    title: Text(file_name),
                    onTap: () {
                      FileUtils.readFromFile(file_name).then(
                        (contents) {
                          return showDialog(
                            context: context,
                            builder: (context) {
                              return Container(
                                color: Colors.white,
                                // decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.only(
                                //         topLeft: Radius.circular(30),
                                //         topRight: Radius.circular(30))),
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  contents,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
