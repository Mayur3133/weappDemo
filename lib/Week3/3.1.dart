import 'package:carousel_slider/carousel_slider.dart';
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
  double _scaleFactor = 1.0;
  double _baseScaleFactor = 1.0;

  // bool isvertical = true;

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

              // onScaleStart: (details) {
              //   _baseScaleFactor = _scaleFactor;
              // },
              // onScaleUpdate: (details) {
              //   setState(() {
              //     _scaleFactor = _baseScaleFactor * details.scale;
              //   });
              // },
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

              child: CarouselSlider.builder(
                  itemCount: img.length,
                  options: CarouselOptions(
                    viewportFraction: 1,
                    enlargeCenterPage: false,
                    scrollDirection: dir ? Axis.vertical : Axis.horizontal,
                    height: MediaQuery.of(context).size.height,
                    autoPlay: false,
                    autoPlayInterval: Duration(seconds: 1),
                    reverse: false,
                    // aspectRatio: 5.0,
                  ),
                  itemBuilder: (context, i, id) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      child: PhotoViewGallery.builder(
                        scrollDirection: dir ? Axis.vertical : Axis.horizontal,
                        itemCount: img.length,
                        scrollPhysics: NeverScrollableScrollPhysics(),
                        builder: (context, index) {
                          final imagelist = img[index];

// return PhotoViewGallery.builder(
//               itemCount: img.length,
//               scrollDirection: dir ? Axis.vertical : Axis.horizontal,
//
//               //  allowImplicitScrolling: true,
//               builder: (BuildContext context, int index) {
                          return PhotoViewGalleryPageOptions(
                              minScale: PhotoViewComputedScale.contained * 0.8,
                              maxScale: PhotoViewComputedScale.covered * 2,
                              imageProvider: AssetImage(img[i]));
                        },
                        enableRotation: true,
                      ),
                    );
                  }),
            )),
      ),
    );
  }
}
