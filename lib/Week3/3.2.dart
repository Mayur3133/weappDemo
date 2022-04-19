import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class imgpic extends StatefulWidget {
  const imgpic({Key? key}) : super(key: key);

  @override
  State<imgpic> createState() => _imgpicState();
}

class _imgpicState extends State<imgpic> {
  final ImagePicker _picker = ImagePicker();
  XFile? photo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Imagepicker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                              leading: Icon(Icons.photo),
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
                            : AssetImage('image/user.jpg') as ImageProvider,
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
