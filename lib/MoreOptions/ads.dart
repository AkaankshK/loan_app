import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/material.dart';

class ADS extends StatefulWidget {
  @override
  _ADSState createState() => _ADSState();
}

class _ADSState extends State<ADS> {


  BannerAd myBanner;
  List<String> testDeviceIds = ["600188C4404472774243966B284E2603"];
  BannerAd buildBannerAd() {
    return BannerAd(
      // adUnitId: BannerAd.testAdUnitId,
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      size: AdSize.banner,
      listener: (MobileAdEvent event) {
        print(event);
        if(event == MobileAdEvent.loaded) myBanner..show();
      }
    );
  }
  @override
  void initState() {
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
    myBanner = buildBannerAd()..load();
  }

  @override
  void dispose() {
    myBanner.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Test Ad Banner :) '),
      ),
    );
  }
}