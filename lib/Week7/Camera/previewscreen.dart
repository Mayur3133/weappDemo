import 'dart:io';
import 'package:flutter/material.dart';
import 'capturescreen.dart';

class glrscn extends StatelessWidget {
  final File imageFile;
  final List<File> fileList;

  // final File videofile;

  glrscn({
    required this.imageFile,
    required this.fileList,
    // required this.videofile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(children: [
                Expanded(
                  child: Container(
                    child: Image.file(imageFile),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 650, left: 330),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => gallery.camscn(
                            imageFileList: fileList,
                            // videofileList:fileList,
                            // videofile: videofile,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 70,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.grey),
                      child: Icon(Icons.photo, color: Colors.white),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
