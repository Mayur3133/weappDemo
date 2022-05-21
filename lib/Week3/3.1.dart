import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class gesture extends StatefulWidget {
  const gesture({
    Key? key,
  }) : super(key: key);

  @override
  State<gesture> createState() => _gestureState();
}

class _gestureState extends State<gesture> {
  DragStartDetails? startVerticalDragDetails;
  DragUpdateDetails? updateVerticalDragDetails;

  List img = [
    'image/burger.jpg',
    'image/pizza.jpg',
    'image/pasta.jpg',
    'image/dosa.jpg',
    'image/Sandwich.jpg',
    'image/rice.jpg',
    'image/chi.jpg',
    'image/lat.jpg',
    'image/chicken.jpg',
  ];
  bool dir = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestures'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GestureDetector(
            onHorizontalDragEnd: (details) {
              setState(() {
                dir = false;
              });
            },
            onVerticalDragEnd: (details) {
              setState(() {
                dir = true;
              });
            },
            // onPanStart: (details) {
            //   setState(() {});
            // },
            child: PhotoViewGallery.builder(
              itemCount: img.length,
              scrollDirection: dir ? Axis.vertical : Axis.horizontal,

              //  allowImplicitScrolling: true,
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                    minScale: PhotoViewComputedScale.contained * 0.8,
                    maxScale: PhotoViewComputedScale.covered * 2,
                    imageProvider: AssetImage(img[index]));
              },
              enableRotation: true,
            ),
          ),
        ),
      ),
    );
  }
}
