// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
//
// class locali extends StatefulWidget {
//   const locali({Key? key}) : super(key: key);
//
//   @override
//   State<locali> createState() => _localiState();
// }
//
// class _localiState extends State<locali> {
//   List locale = [
//     // {'name': 'Arabic', 'locale': Locale('ar', 'BH')},
//     {'name': 'ENGLISH', 'locale': Locale('en', 'US')},
//     {'name': 'ગુજરાતી', 'locale': Locale('gu', 'IN')},
//     {'name': 'हिंदी', 'locale': Locale('hi', 'IN')},
//     {'name': '한국인(Korean)', 'locale': Locale('ko', 'KR')},
//     {'name': 'Dutch', 'locale': Locale('nl', 'BQ')},
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "title",
//           style: TextStyle(fontSize: 25),
//         ).tr(),
//         centerTitle: true,
//         backgroundColor: Colors.black45,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('text').tr(),
//             SizedBox(
//               height: 20,
//             ),
//             Text('name').tr(),
//             SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 showModalBottomSheet(
//                     context: context,
//                     builder: (context) {
//                       return Container(
//                         // height: 250,
//                         child: ListView.separated(
//                           shrinkWrap: true,
//                           itemBuilder: (context, index) {
//                             return ListTile(
//                               onTap: () {
//                                 context.locale = locale[index]['locale'];
//                                 Navigator.pop(context);
//                                 // updating(locale[index]['locale']);
//                               },
//                               contentPadding: EdgeInsets.zero,
//                               title: Text(
//                                 locale[index]['name'].toString(),
//                                 textAlign: TextAlign.center,
//                               ),
//                             );
//                           },
//                           separatorBuilder: (context, index) {
//                             return Divider(
//                               color: Colors.black54,
//                             );
//                           },
//                           itemCount: locale.length,
//                         ),
//                       );
//                     });
//               },
//               child: Text("Language").tr(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
