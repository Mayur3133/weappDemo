import 'package:flutter/material.dart';
import 'package:fluttertask/week6/reward.dart';

import 'package:provider/provider.dart';

class RewardAdsExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    AdmobHelper admobHelper = Provider.of<AdmobHelper>(context,listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text("RewardAd "),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer(builder: (context, value, child) {
              return Text("Point ${
              admobHelper.getrewardd()
              }");
      }),
            ElevatedButton(onPressed: (){admobHelper.createRewardAd();}, child: Text("Load Reward Ads")),
            ElevatedButton(onPressed: (){admobHelper.showRewardAd();}, child: Text("Show Reward ads"))
          ],
        ),
      ),
    );
  }
}