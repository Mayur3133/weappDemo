import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  final String data;

  const PostScreen(this.data);

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Screen"),
      ),
      body: Center(
          child: Text(
        widget.data,
        style: TextStyle(fontSize: 24),
      )),
    );
  }
}

//
// import 'dart:async';
//
// import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
// import 'package:flutter/material.dart';
//
//
//
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
//   TextEditingController _editingController = TextEditingController();
//
//   Timer? _timerLink;
//
//   _createAndShare() async {
//     final DynamicLinkParameters parameters = DynamicLinkParameters(
//       uriPrefix: 'https://bootcamptask.page.link',
//       link: Uri.https('yourapp.com', 'cat', {"text": _editingController.text.trim()}),
//       androidParameters: AndroidParameters(
//         packageName: 'com.example.bootcamp_deeplinking',
//       ),
//       iosParameters: IOSParameters(
//         bundleId: 'com.example.bootcamp_deeplinking',
//       ),
//       socialMetaTagParameters: SocialMetaTagParameters(
//         title: 'Example of a Dynamic Link',
//         description: 'This link works whether app is installed or not!',
//       ),
//     );
//     return '$ShortDynamicLink($parameters)';
//     // final ShortDynamicLink shortDynamicLink = await parameters.buildShortLink();
//     // final Uri shortUrl = shortDynamicLink.shortUrl;
//     // print(shortUrl);
//     // Share.share('Here is my deeplink $shortUrl');
//   }
//
//
//   Future<void> _retrieveDynamicLink() async {
//
//
//     FirebaseDynamicLinks.instance.onLink;
//   }
//
//   void didChangeAppLifecycleState(AppLifecycleState state) {
//     print(state);
//     if (state == AppLifecycleState.resumed) {
//       _timerLink =
//           Timer(Duration(milliseconds: 500), () => _retrieveDynamicLink());
//     }
//   }
//
//   @override
//   void dispose() {
//     _timerLink!.cancel();
//     super.dispose();
//   }
//
//
//
//   @override
//   initState() {
//     WidgetsBinding.instance!.addObserver(this);
//     super.initState();
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Deep Linking"),
//       ),
//       body: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: TextField(
//               controller: _editingController,
//               decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 hintText: "Enter Text To Share",
//               ),
//             ),
//           ),
//           RaisedButton(
//             child: Text("Create DeepLink and Share"),
//             onPressed: () {
//               _createAndShare();
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
