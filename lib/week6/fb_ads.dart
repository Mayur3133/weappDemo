//https://admob-plus.github.io/docs/cordova/test-ads

import 'package:flutter/material.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';

class AdsPage extends StatefulWidget {
  const AdsPage({
    Key? key,
  }) : super(key: key);

  @override
  AdsPageState createState() => AdsPageState();
}

class AdsPageState extends State<AdsPage> {
  bool _isInterstitialAdLoaded = false;
  bool _isRewardedAdLoaded = false;
  int point=0;
  Widget _currentAd = SizedBox(
    width: 0.0,
    height: 0.0,
  );

  @override
  void initState() {
    super.initState();

    FacebookAudienceNetwork.init(
      testingId: "a77955ee-3304-4635-be65-81029b0f5201",
      // iOSAdvertiserTrackingEnabled: true,
    );

    _loadInterstitialAd();
    _loadRewardedVideoAd();
  }

  set() {
    if (mounted) {
      setState(() {});
    }
  }

  void _loadInterstitialAd() {
    FacebookInterstitialAd.loadInterstitialAd(
      placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
      listener: (result, value) {
        print(">> FAN > Interstitial Ad: $result --> $value");
        if (result == InterstitialAdResult.LOADED)
          _isInterstitialAdLoaded = true;

        if (result == InterstitialAdResult.DISMISSED &&
            value["invalidated"] == true) {
          _isInterstitialAdLoaded = false;
          _loadInterstitialAd();
        }
      },
    );
  }

  void _loadRewardedVideoAd() {
    FacebookRewardedVideoAd.loadRewardedVideoAd(
      placementId: "VID_HD_16_9_15S_APP_INSTALL#YOUR_PLACEMENT_ID",
      listener: (result, value) {
        print("Rewarded Ad: $result --> $value");
        if (result == RewardedVideoAdResult.LOADED){ _isRewardedAdLoaded = true;}
        if (result == RewardedVideoAdResult.VIDEO_COMPLETE) {

          point=point+10;
          set();
        }
          if (result ==
                RewardedVideoAdResult.VIDEO_CLOSED &&
            (value == true || value["invalidated"] == true)) {
          _isRewardedAdLoaded = false;
          _loadRewardedVideoAd();
        }
      },
    );
  }

  Widget _nativeBannerAd() {
    return FacebookNativeAd(
      placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
      //2312433698835503_2964953543583512",
      adType: NativeAdType.NATIVE_BANNER_AD,
      backgroundColor: Colors.orangeAccent,
      titleColor: Colors.black,
      descriptionColor: Colors.black,
      buttonColor: Colors.lightBlue,
      bannerAdSize: NativeBannerAdSize.HEIGHT_100,
      width: 300,
      buttonTitleColor: Colors.black,
      buttonBorderColor: Colors.black,
     // height: 200,
      listener: (result, value) {
        print("Native Banner Ad: $result --> $value");
      },
    );
  }

  Widget _nativeAd() {
    return FacebookNativeAd(
      placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
      adType: NativeAdType.NATIVE_AD_VERTICAL,
      width: double.infinity,
      height: 300,
      backgroundColor: Colors.orangeAccent,
      titleColor: Colors.black,
      descriptionColor: Colors.black,
      buttonColor: Colors.lightBlue,
      buttonTitleColor: Colors.black,
      buttonBorderColor: Colors.black,
      listener: (result, value) {
        print("Native Ad: $result --> $value");
      },
      keepExpandedWhileLoading: true,
      expandAnimationDuraion: 1000,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Facebook Ads")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                return _showBannerAd();
              },
              child: Text("      Banner Ad      ")),
            ElevatedButton(
                onPressed: () {
                  return _showNativeAd();
                },
                child: Text("      Native Ad      ")),

            ElevatedButton(
                onPressed: () {
                  return _showInterstitialAd();
                },
                child: Text("    Interstitial Ad   ")),
            Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                 _showRewardedAd();
                    },
                    child: Text("    Rewarded Ad   ")),
                Text("${point}"),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  return _showNativeBannerAd();
                },
                child: Text("Native Banner Ad")),
            Flexible(
              child: Align(
                alignment: Alignment(0, 1.0),
                child: _currentAd,
              ),
            )
          ],
        ),
      ),
    );
  }

  _showInterstitialAd() {
    if (_isInterstitialAdLoaded == true)
      FacebookInterstitialAd.showInterstitialAd();
    else
      print("Interstial Ad not yet loaded!");
  }

  _showRewardedAd() {
    if (_isRewardedAdLoaded == true)
      FacebookRewardedVideoAd.showRewardedVideoAd();
    else
      print("Rewarded Ad not yet loaded!");
  }

  _showBannerAd() {
    _currentAd = FacebookBannerAd(
      placementId: "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
      //#2312433698835503_2964944860251047",
      bannerSize: BannerSize.MEDIUM_RECTANGLE,
      listener: (result, value) {
        print("Banner Ad: $result -->  $value");
      },
    );
    set();
  }

  _showNativeBannerAd() {
    _currentAd = _nativeBannerAd();
    set();
  }

  _showNativeAd() {
    _currentAd = _nativeAd();
    set();
  }
}
