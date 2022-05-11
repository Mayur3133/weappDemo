// import 'dart:math';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_native_admob/flutter_native_admob.dart';
// import 'package:flutter_native_admob/native_admob_controller.dart';
// import 'package:flutter_native_admob/native_admob_options.dart';
//
// class ntv extends StatefulWidget {
//   @override
//   _ntvState createState() => _ntvState();
// }
//
// class _ntvState extends State<ntv> {
//   List<String> images = [
//     'image/1.png',
//     'image/2.png',
//     'image/3.png',
//     'image/4.png',
//     'image/5.png'
//   ];
//
//   late List<Object> dataads;
//
//   @override
//   void initState() {
//     super.initState();
//     setState(() {
//       dataads = List.from(images);
//
//       for (int i = 0; i < 2; i++) {
//         var min = 1;
//         var rm = new Random();
//
//         var rannumpos = min + rm.nextInt(4);
//
//         dataads.insert(rannumpos, nativeAdWidget());
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Center(
//       child: ListView.builder(
//           scrollDirection: Axis.vertical,
//           shrinkWrap: true,
//           itemCount: dataads.length,
//           itemBuilder: (context, index) {
//             if (dataads[index] is String) {
//               return Container(
//                   decoration: BoxDecoration(border: Border.all(width: 10)),
//                   height: 100,
//                   width: 300,
//                   child: Image.asset(dataads[index] as String));
//             } else {
//               return Container(
//                   decoration: BoxDecoration(border: Border.all(width: 10)),
//
//                   height: 300,
//                   width: MediaQuery.of(context).size.width,
//                   //color: Colors.transparent,
//                   child: dataads[index] as nativeAdWidget);
//             }
//           }),
//     ));
//   }
// }
//
// class nativeAdWidget extends StatelessWidget {
//   final _controller = NativeAdmobController();
//
//   @override
//   Widget build(BuildContext context) {
//     return NativeAdmob(
//       adUnitID: "ca-app-pub-3940256099942544/2247696110",
//       loading: Center(child: CircularProgressIndicator()),
//       error: Text("Failed to load the ad"),
//       controller: _controller,
//       type: NativeAdmobType.full,
//       options: NativeAdmobOptions(
//         ratingColor: Colors.red,
//         showMediaContent: true,
//         callToActionStyle:
//             NativeTextStyle(color: Colors.red, backgroundColor: Colors.black),
//         headlineTextStyle: NativeTextStyle(
//           color: Colors.blue,
//         ),
//       ),
//     );
//   }
// }
