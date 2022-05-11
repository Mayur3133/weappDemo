import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'Native ad.dart';

class admobadd extends StatefulWidget {
  @override
  _admobaddState createState() => _admobaddState();
}

class _admobaddState extends State<admobadd> {
  static final AdRequest request = AdRequest(
    keywords: ['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );
  String? testDevice = "YOUR_DEVICE_ID";

  var pnt = 0;
  BannerAd? banner_ad;
  InterstitialAd? _interstitialAd;
  InterstitialAd? _interstitialvideoAd;
  RewardedAd? _rewardedAd;
  RewardedInterstitialAd? _rewardedInterstitialAd;

  @override
  void initState() {
    super.initState();

    banner_ad = BannerAd(
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {},
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    );

    banner_ad!.load();
    _createInterstitialAd();
    _createRewardedAd();
    loadInterstitialvideoAd();
    _createRewardedInterstitialAd();
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/1033173712'
            : 'ca-app-pub-3940256099942544/4411468910',
        request: request,
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('$ad loaded');
            _interstitialAd = ad;
            _interstitialAd!.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');
            _interstitialAd = null;
          },
        ));
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }

  void loadInterstitialvideoAd() {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/8691691433',
        request: request,
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('$ad loaded');
            _interstitialvideoAd = ad;
            // _interstitialvideoAd!.setImmersiveMode(true);
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');
            _interstitialvideoAd = null;
          },
        ));
  }

  void showInterstitialvideoAd() {
    if (_interstitialvideoAd != null) {
      _interstitialvideoAd!.fullScreenContentCallback =
          FullScreenContentCallback(
        onAdShowedFullScreenContent: (InterstitialAd ad) =>
            print('ad onAdShowedFullScreenContent.'),
        onAdDismissedFullScreenContent: (InterstitialAd ad) {
          print('$ad onAdDismissedFullScreenContent.');
          ad.dispose();
          loadInterstitialvideoAd();
        },
        onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
          print('$ad onAdFailedToShowFullScreenContent: $error');
          ad.dispose();
          loadInterstitialvideoAd();
        },
      ); //
      _interstitialvideoAd!.setImmersiveMode(true);

      _interstitialvideoAd!.show();
    }
  }

  void _createRewardedInterstitialAd() {
    RewardedInterstitialAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/5354046379',
        request: AdRequest(),
        rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
          onAdLoaded: (RewardedInterstitialAd ad) {
            print('$ad loaded.');
            _rewardedInterstitialAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedInterstitialAd failed to load: $error');
            _rewardedInterstitialAd = null;
          },
        ));
  }

  void _showRewardedInterstitialAd() {
    if (_rewardedInterstitialAd != null) {
      _rewardedInterstitialAd!.fullScreenContentCallback =
          FullScreenContentCallback(
        onAdShowedFullScreenContent: (RewardedInterstitialAd ad) =>
            print('$ad onAdShowedFullScreenContent.'),
        onAdDismissedFullScreenContent: (RewardedInterstitialAd ad) {
          print('$ad onAdDismissedFullScreenContent.');
          ad.dispose();
          _createRewardedInterstitialAd();
        },
        onAdFailedToShowFullScreenContent:
            (RewardedInterstitialAd ad, AdError error) {
          print('$ad onAdFailedToShowFullScreenContent: $error');
          ad.dispose();
          _createRewardedInterstitialAd();
        },
      );

      _rewardedInterstitialAd!.setImmersiveMode(true);
      _rewardedInterstitialAd!.show(
          onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
        pnt = pnt + reward.amount as int;
        Fluttertoast.showToast(
            msg: "Reward Interstitial Collected",
            // msg: "${rewardedInterstitalPoint} coins",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black54,
            textColor: Colors.white,
            fontSize: 16.0);
        print('(${pnt}');
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    banner_ad?.dispose();
    _interstitialAd?.dispose();
    _rewardedAd?.dispose();
    _rewardedInterstitialAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AdMob Ad '),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              //  width: _bannerAd!.size.width.toDouble(),
              height: 80,
              child: AdWidget(ad: banner_ad!),
            ),
            ElevatedButton(
                onPressed: () => _showInterstitialAd(),
                child: Text("      Interstitial Ad     ")),
            ElevatedButton(
                onPressed: () => showInterstitialvideoAd(),
                child: Text("Interstitial video Ad")),
            // InkWell(
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(
            //       builder: (context) {
            //         return ntv();
            //       },
            //     ));
            //   },
            //   child: Container(
            //     alignment: Alignment.center,
            //     height: 35,
            //     width: 165,
            //     decoration: BoxDecoration(
            //         color: Colors.blue, borderRadius: BorderRadius.circular(5)),
            //     child: Text("Native Ad",
            //         textAlign: TextAlign.center,
            //         style: TextStyle(
            //           color: Colors.white,
            //           fontWeight: FontWeight.w500,
            //           fontSize: 15,
            //         )),
            //   ),
            // ),
            ElevatedButton(
                onPressed: () => _showRewardedInterstitialAd(),
                child: Text(" RewardedInter Ad ")),
            Column(
              children: [
                ElevatedButton(
                    onPressed: () => _showRewardedAd(),
                    child: Text("      Rewarde Ad      ")),
                Text("${pnt}"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _createRewardedAd() {
    RewardedAd.load(
      adUnitId: 'ca-app-pub-3940256099942544/5224354917',
      request: AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (RewardedAd ad) {
          // print('$ad loaded.');
          // // Keep a reference to the ad so you can show it later.
          _rewardedAd = ad;
        },
        onAdFailedToLoad: (LoadAdError error) {
          print('RewardedAd failed to load: $error');
          _rewardedAd = null;
        },
      ),
    );
  }

  void _showRewardedAd() {
    if (_rewardedAd != null) {
      _rewardedAd!.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (RewardedAd ad) {
          print('ad onAdShowedFullScreenContent.');
        },
        onAdDismissedFullScreenContent: (RewardedAd ad) {
          print('ad onAdDismissedFullScreenContent.');
          ad.dispose();
          _createRewardedAd();
          setState(() {
            pnt;
          });
        },
        onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
          print('onAdFailedToShowFullScreenContent: $error');
          ad.dispose();
          _createRewardedAd();
        },
      );
      _rewardedAd!.setImmersiveMode(true);
      _rewardedAd!.show(
        onUserEarnedReward: (ad, reward) {
          pnt = pnt + reward.amount as int;

          print("${pnt}");
        },
      );
    }
  }
}
