// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
// import 'package:flutter/material.dart';
//
// class analytics extends StatefulWidget {
//   const analytics({Key? key}) : super(key: key);
//
//   @override
//   State<analytics> createState() => _analyticsState();
// }
//
// class _analyticsState extends State<analytics> {
//   FirebaseAnalytics analytics = FirebaseAnalytics.instance;
//
//   Future<List<Note>>? _notes;
//   late FirebaseFirestore _firestore;
//   TextEditingController _controller = TextEditingController();
//
//   Future<List<Note>> fetchNotes() async {
//     var result = await _firestore.collection('notes').get();
//     if (result.docs.isEmpty) {
//       return [];
//     }
//     var notes = <Note>[];
//     for (var doc in result.docs) {
//       notes.add(Note.fromMap(doc.data()));
//     }
//     return notes;
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     FirebaseCrashlytics.instance.setCustomKey('userUID', 'tusharojha');
//     _firestore = FirebaseFirestore.instance;
//     _notes = fetchNotes();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (_) => AlertDialog(
//               title: Text("What's the note about?"),
//               content: TextField(
//                 controller: _controller,
//               ),
//               actions: [
//                 ChipButton(
//                   title: 'Yes',
//                   action: () async {
//                     if (_controller.text.isEmpty) {
//                       await FirebaseCrashlytics.instance
//                           .recordError("error", null,
//                           reason: 'a fatal error',
//                           // Pass in 'fatal' argument
//                           fatal: true);
//                     }
//                     // This creates an empty document and returns the auto-gen uid.
//                     var uid = _firestore.collection('notes').doc().id;
//
//                     // adding data to the document using the uid we got.
//                     await _firestore.collection('notes').doc(uid).set({
//                       'title': _controller.text,
//                       'uid': uid,
//                       'completed': false
//                     });
//                     Navigator.pop(context);
//                     setState(() {
//                       _notes = fetchNotes();
//                       _controller.clear();
//                     });
//                   },
//                 ),
//                 ChipButton(
//                     title: 'No',
//                     action: () => FirebaseCrashlytics.instance.crash()),
//               ],
//             ),
//           );
//         },
//         child: Icon(Icons.add),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: FutureBuilder(
//               future: _notes,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Center(
//                     child: CircularProgressIndicator(),
//                   );
//                 }
//
//                 if ((snapshot.data as List).isEmpty) {
//                   return Center(
//                     child: Text('No Notes Added.'),
//                   );
//                 }
//
//                 return RefreshIndicator(
//                   onRefresh: () async {
//                     setState(() {
//                       _notes = fetchNotes();
//                     });
//                   },
//                   child: ListView.builder(
//                     itemCount: (snapshot.data as List).length,
//                     itemBuilder: (context, index) {
//                       var note = (snapshot.data as List<Note>)[index];
//                       return NoteTile(
//                         note: note,
//                         onDelete: () async {
//                           await _firestore
//                               .collection('notes')
//                               .doc(note.uid)
//                               .delete();
//                           setState(() {
//                             _notes = fetchNotes();
//                           });
//                         },
//                         onCompleted: (dynamic val) async {
//                           await _firestore
//                               .collection('notes')
//                               .doc(note.uid)
//                               .update({
//                             'completed': val as bool,
//                           });
//                         },
//                       );
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../w3.dart';
import '../../w9.dart';

class customlink extends StatefulWidget {
  const customlink({Key? key}) : super(key: key);

  @override
  State<customlink> createState() => _customlinkState();
}

class _customlinkState extends State<customlink> {
  String _shortUrl = '';
  final String DynamicLink = 'https://weeklytask.page.link/naxz';
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // this._initDynamicLinks();
    retrieveDynamicLink(context);
  }

  void _initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink.listen(
        (PendingDynamicLinkData dynamicLink) async {
      final Uri? deepLink = dynamicLink.link;

      if (deepLink != null) {
        Navigator.popUntil(context, ModalRoute.withName('/week9'));
      }
    }, onError: (e) async {
      Navigator.pushNamed(context, '/week2');
    });

    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      Navigator.pushNamed(context, deepLink.path);
    }
  }

  Future<void> retrieveDynamicLink(BuildContext context) async {
    try {
      final PendingDynamicLinkData? data =
          await FirebaseDynamicLinks.instance.getInitialLink();
      final Uri? deepLink = data?.link;

      if (deepLink != null) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => week9()));
      }

      FirebaseDynamicLinks.instance.onLink
          .listen((PendingDynamicLinkData dynamicLink) async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => week9()));
      });
      setState(() {});
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _createDynamicLink() async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: 'https://weeklytask.page.link',
      link: Uri.parse(DynamicLink),
      androidParameters: AndroidParameters(
        packageName: 'com.example.fluttertask.android',
        minimumVersion: 1,
      ),
      iosParameters: IOSParameters(
        bundleId: 'com.example.fluttertask.ios',
        minimumVersion: '1',
        appStoreId: '123',
      ),
    );

    final ShortDynamicLink shortDynamicLink =
        await dynamicLinks.buildShortLink(parameters);
    final Uri shortUrl = shortDynamicLink.shortUrl;

    setState(() {
      _shortUrl = shortUrl.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dynamic_Link",
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _createDynamicLink();
                    },
                    child: Text(
                      "Page Link",
                    ),
                  ),
                   SizedBox(
                    height: 20,
                  ),
                  if (_shortUrl.isNotEmpty)
                    Center(
                      child: Column(
                        children: [
                          Text(_shortUrl),
                          IconButton(
                            onPressed: () {
                              Clipboard.setData(ClipboardData(text: _shortUrl));
                            },
                            icon: Icon(Icons.copy),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
