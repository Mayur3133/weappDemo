// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:share_plus/share_plus.dart';
// import 'package:image_preview/image_preview.dart';
//
// // class DemoApp extends StatefulWidget {
// //   const DemoApp({Key? key}) : super(key: key);
// //
// //   @override
// //   DemoAppState createState() => DemoAppState();
// // }
// //
// // class DemoAppState extends State<DemoApp> {
// //   String text = '';
// //   String subject = '';
// //   List<String> imagePaths = [];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Sharing'),
// //         ),
// //         body: SingleChildScrollView(
// //           child: Padding(
// //             padding: const EdgeInsets.all(24.0),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: <Widget>[
// //                 TextField(
// //                   decoration: const InputDecoration(
// //                     labelText: 'Share text:',
// //                   ),
// //                   maxLines: 2,
// //                   onChanged: (String value) => setState(() {
// //                     text = value;
// //                   }),
// //                 ),
// //                 // TextField(
// //                 //   decoration: const InputDecoration(
// //                 //     labelText: 'Share subject:',
// //                 //     hintText: 'Enter subject to share (optional)',
// //                 //   ),
// //                 //   maxLines: 2,
// //                 //   onChanged: (String value) => setState(() {
// //                 //     subject = value;
// //                 //   }),
// //                 // ),
// //                 Padding(padding: EdgeInsets.only(top: 12.0)),
// //                 //   ImagePreview(imagePaths, onDelete: _onDeleteImage),
// //                 ListTile(
// //                   leading: const Icon(Icons.add),
// //                   title: const Text('Add image'),
// //                   onTap: () async {
// //                     final imagePicker = ImagePicker();
// //                     final pickedFile = await imagePicker.pickImage(
// //                       source: ImageSource.gallery,
// //                     );
// //                     if (pickedFile != null) {
// //                       setState(() {
// //                         imagePaths.add(pickedFile.path);
// //                       });
// //                     }
// //                   },
// //                 ),
// //                 const Padding(padding: EdgeInsets.only(top: 12.0)),
// //                 Builder(
// //                   builder: (BuildContext context) {
// //                     return ElevatedButton(
// //                       onPressed: text.isEmpty && imagePaths.isEmpty
// //                           ? null
// //                           : () => _onShare(context),
// //                       child: const Text('Share'),
// //                     );
// //                   },
// //                 ),
// //                 const Padding(padding: EdgeInsets.only(top: 12.0)),
// //                 // Builder(
// //                 //   builder: (BuildContext context) {
// //                 //     return ElevatedButton(
// //                 //       onPressed: text.isEmpty && imagePaths.isEmpty
// //                 //           ? null
// //                 //           : () => _onShareWithResult(context),
// //                 //       child: const Text('Share With Result'),
// //                 //     );
// //                 //   },
// //                 // ),
// //               ],
// //             ),
// //           ),
// //         ));
// //   }
// //
// //   void _onDeleteImage(int position) {
// //     setState(() {
// //       imagePaths.removeAt(position);
// //     });
// //   }
// //
// //   void _onShare(BuildContext context) async {
// //
// //     final box = context.findRenderObject() as RenderBox?;
// //
// //     if (imagePaths.isNotEmpty) {
// //       await Share.shareFiles(imagePaths,
// //           text: text,
// //           subject: subject,
// //           sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
// //     } else {
// //       await Share.share(text,
// //           subject: subject,
// //           sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
// //     }
// //   }
// //
// //
// //
// //
// //
// //   // void _onShareWithResult(BuildContext context) async {
// //   //   final box = context.findRenderObject() as RenderBox?;
// //   //   ShareResult result;
// //   //   if (imagePaths.isNotEmpty) {
// //   //     result = await Share.shareFilesWithResult(imagePaths,
// //   //         text: text,
// //   //         subject: subject,
// //   //         sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
// //   //   } else {
// //   //     result = await Share.shareWithResult(text,
// //   //         subject: subject,
// //   //         sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
// //   //   }
// //   //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //   //     content: Text("Share result: ${result.status}"),
// //   //   ));
// //   // }
// // }
// //
//
//
// class MyApp extends StatefulWidget{
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   var  selectedfile;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title:Text("Share Text, URL, Image or File"),
//           backgroundColor: Colors.redAccent,
//         ),
//         body: Column(
//
//           children: [
//             Container(
//               alignment: Alignment.center,
//               child: ElevatedButton(
//                   onPressed: (){
//                     Share.share('Hello Welcome to FlutterCampus', subject: 'Welcome Message');
//                     //subject is optional, and it is required for Email App.
//                   },
//                   child: Text("Share Plain Text")),
//             ),
//
//             Container(
//               alignment: Alignment.center,
//               child: ElevatedButton(
//                   onPressed: (){
//                     Share.share('Visit FlutterCampus at https://www.fluttercampus.com');
//                   },
//                   child: Text("Share text with URL")),
//             ),
//
//             Container(
//               alignment: Alignment.center,
//               child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(primary: Colors.redAccent),
//                   onPressed: () async {
//                     selectedfile = await FilePicker.getFile(
//                       type: FileType.custom,
//                       allowedExtensions: ['jpg', 'pdf', 'mp4'],
//                       //allowed extension to choose
//                     );
//
//                     setState((){});
//                   },
//                   child: Text("Pick File to Share")),
//             ),
//
//             Container(
//               alignment: Alignment.center,
//               child: Text(selectedfile == null?"No File Selected":selectedfile.path),
//             ),
//
//
//             Container(
//               alignment: Alignment.center,
//               child: ElevatedButton(
//                   style: ElevatedButton.styleFrom(primary: Colors.redAccent),
//                   onPressed: () async {
//                     if(selectedfile == null){
//                       print("No any file is selected.");
//                     }else{
//                       Share.shareFiles([selectedfile.path], text: "View File");
//                     }
//
//                     setState((){});
//                   },
//                   child: Text("Share Picked File")),
//             ),
//
//
//           ],
//         )
//     );
//   }
// }