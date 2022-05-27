import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'post screen.dart';
import 'utils.dart';

class dynamiclink extends StatefulWidget {
  @override
  _dynamiclinkState createState() => _dynamiclinkState();
}

class _dynamiclinkState extends State<dynamiclink> {
  String url = "";

  @override
  void initState() {
    initDynamicLinks();
    super.initState();
  }

  ///Retreive dynamic link firebase.
  void initDynamicLinks() async {
    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      handleDynamicLink(deepLink);
    }
    FirebaseDynamicLinks.instance.onLink;
  }

  handleDynamicLink(Uri url) {
    List<String> separatedString = [];
    separatedString.addAll(url.path.split('/'));
    if (separatedString[1] == "post") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PostScreen(separatedString[2])));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () async {
                  try {
                    url = await AppUtils.buildDynamicLink();
                  } catch (e) {
                    print(e);
                  }
                  setState(() {});
                },
                child: Text(
                  "Generate Dynamic Link",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            if (url.isNotEmpty)
              Center(
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: url,
                      style: TextStyle(fontSize: 20, color: Colors.black54)),
                  WidgetSpan(
                      child: IconButton(
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: url));
                          },
                          icon: Icon(Icons.copy))),
                ])),
              ),
          ],
        ),
      ),
    );
  }
}
