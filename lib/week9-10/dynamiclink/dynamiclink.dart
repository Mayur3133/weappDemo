import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class dynamiclink extends StatefulWidget {
  const dynamiclink({Key? key}) : super(key: key);

  @override
  State<dynamiclink> createState() => _dynamiclinkState();
}

class _dynamiclinkState extends State<dynamiclink> {
  String Dynamicurl = "";

  final String DynamicLinkApp = 'https://weeklytask.page.link/naxz';
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "DynamicLink",
        ),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Column(
                children: [
                  if (Dynamicurl.isNotEmpty)
                    Center(
                      child: Column(
                        children: [
                          Text(Dynamicurl),
                          IconButton(
                            onPressed: () {
                              Clipboard.setData(
                                  ClipboardData(text: Dynamicurl));
                            },
                            icon: Icon(Icons.copy),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      buildDynamicLink(true);
                    },
                    child: Text(
                      "App Link",
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

  Future<void> buildDynamicLink(bool short) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      link: Uri.parse(DynamicLinkApp),
      uriPrefix: "https://weeklytask.page.link",
      androidParameters: AndroidParameters(
        packageName: "com.example.fluttertask.android",
        minimumVersion: 0,
      ),
      iosParameters: IOSParameters(
        bundleId: "com.example.fluttertask.ios",
        minimumVersion: '0',
      ),
    );
    Uri url;
    if (short) {
       ShortDynamicLink shortLink =
      await dynamicLinks.buildShortLink(parameters);
      url = shortLink.shortUrl;
    } else {
      url = await dynamicLinks.buildLink(parameters);
    }

    setState(() {
      Dynamicurl = url.toString();
    });
  }
}
