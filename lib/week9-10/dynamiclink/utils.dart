import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

class AppUtils {
  static Future<String> buildDynamicLink() async {
    String url = "https://examplees.page.link/mVFa";
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: "https://examplees.page.link",
      link: Uri.parse('https://examplees.page.link/mVFa'),
      androidParameters: AndroidParameters(
        packageName: "com.example.fluttertask",
        minimumVersion: 0,
      ),
      iosParameters: IOSParameters(
        bundleId: "com.example.dynamicLinkDemo",
        minimumVersion: '0',
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
          // description: "Once upon a time in the town",
          imageUrl: Uri.parse(
              "https://firebasestorage.googleapis.com/v0/b/weap-demo.appspot.com/o/files%2Fid-099-manthan%20?alt=media&token=b3f1a100-af7d-4413-9bdd-7d8b535d3604"),
          title: "Breaking Code's Post"
          ),
    );
    return '$ShortDynamicLink($parameters)';
   // final ShortDynamicLink dynamicUrl = await parameters.buildShortLink();
   //  return dynamicUrl.shortUrl.toString();
  }
}
