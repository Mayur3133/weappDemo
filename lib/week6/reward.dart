import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class rwd extends StatefulWidget {
  const rwd({Key? key}) : super(key: key);

  @override
  State<rwd> createState() => _rwdState();
}

class _rwdState extends State<rwd> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class AdmobHelper extends ChangeNotifier {
  late RewardedAd _rewardedAd;

  var rewardpoint = 0;

  int getrewardd() => rewardpoint;
  int attempt = 0;

  static String get bannerUnit => 'ca-app-pub-3940256099942544/5224354917';

  static initialization() {
    if (MobileAds.instance == null) {
      MobileAds.instance.initialize();
    }
  }

  void createRewardAd() {
    RewardedAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/5224354917',
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            print('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            this._rewardedAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            //  print('RewardedAd failed to load: $error');
          },
        ));
  }

  void showRewardAd() {
    if (_rewardedAd != null) {
      _rewardedAd.show(onUserEarnedReward: (ad, rpoint) {
        rewardpoint = rewardpoint + rpoint.amount as int;
        print("Adds Reward is ${rewardpoint}");

        notifyListeners();
      });
      _rewardedAd.fullScreenContentCallback = FullScreenContentCallback(
        onAdShowedFullScreenContent: (RewardedAd ad) =>
            print('$ad onAdShowedFullScreenContent.'),
        onAdDismissedFullScreenContent: (RewardedAd ad) {
          print('$ad onAdDismissedFullScreenContent.');
          ad.dispose();
        },
        onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
          print('$ad onAdFailedToShowFullScreenContent: $error');
          ad.dispose();
        },
        onAdImpression: (RewardedAd ad) => print('$ad impression occurred.'),
      );
    }
  }
}
