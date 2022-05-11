import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertask/Week7/Camera/previewscreen.dart';

class gallery extends StatelessWidget {
  final List<File> imageFileList;

  //  final List<File> videofileList;
  // final File videofile;

  const gallery.camscn({
    required this.imageFileList,
    // required this.videofileList, required this.videofile,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 10),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  'Gallery',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                children: [
                  for (File imageFile in imageFileList)
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => glrscn(
                                fileList: imageFileList,
                                imageFile: imageFile,
                                // videofile: videofile,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          child: Image.file(
                            imageFile,
                            fit: BoxFit.cover,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              style: BorderStyle.solid,
                              color: Colors.black54,
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
