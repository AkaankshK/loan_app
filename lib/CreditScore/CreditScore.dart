import 'package:firebase_admob/firebase_admob.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loanapp/web_view_container.dart';



Map<int, Color> colors = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

class CreditPage extends StatefulWidget {
  @override
  _CreditPageState createState() => _CreditPageState();
}

class _CreditPageState extends State<CreditPage> {
  MaterialColor yellow = MaterialColor(0xffde903b, colors);
  MaterialColor darkBlue = MaterialColor(0xff0f3f81, colors);

  BannerAd myBanner;
  List<String> testDeviceIds = ["600188C4404472774243966B284E2603"];
  BannerAd buildBannerAd() {
    return BannerAd(
        // adUnitId: BannerAd.testAdUnitId,
        adUnitId: BannerAd.testAdUnitId,
        size: AdSize.banner,
        listener: (MobileAdEvent event) {
          print(event);
          if (event == MobileAdEvent.loaded)
            myBanner..show(anchorType: AnchorType.top);
        });
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
      body: getBody(),
    );
  }

  getBody() {
    return Stack(
      children: [
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/background1.png", fit: BoxFit.fill)),
        getContent(),
      ],
    );
  }

  getContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  "Credit Report",
                  style: TextStyle(fontSize: 25),
                ),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30, left: 30),
                child: Text(
                  "Here is",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Your ",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "Credit Report",
                style: TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold, color: yellow),
              )
            ],
          ),
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      flex: 50,
                      child: AspectRatio(
                        aspectRatio: 4,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WebViewContainer(
                                        'https://www.wishfin.com/cibil-score')));
                          },
                          child: Image.asset(
                            "assets/u.png",
                          ),
                        ),
                      )),
                  Expanded(
                      flex: 50,
                      child: AspectRatio(
                        aspectRatio: 4,
                        child: Image.asset(
                          "assets/uu.png",
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                      flex: 50,
                      child: AspectRatio(
                        aspectRatio: 4,
                        child: Image.asset(
                          "assets/uuu.png",
                        ),
                      )),
                  Expanded(
                      flex: 50,
                      child: AspectRatio(
                        aspectRatio: 4,
                        child: Image.asset(
                          "assets/uuuu.png",
                        ),
                      )),
                ],
              ),
            ),
          ]),
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            color: darkBlue,
            child: Center(
              child: Text(
                "Ad for AdMob",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Image.asset("assets/p.png"),
              ),
              Text(
                "Get Credit report for ",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "\u20b91500",
                style: TextStyle(
                    fontSize: 20, decoration: TextDecoration.lineThrough),
              ),
              Text(
                " FREE",
                style: TextStyle(fontSize: 20, color: Colors.red),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 50,
                child: Image.asset(
                  "assets/fix-credit-score.png",
                  height: 100,
                  width: 150,
                ),
              ),
              Expanded(
                flex: 50,
                child: Image.asset(
                  "assets/creditscorestuff.jpg",
                  height: 100,
                  width: 150,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: <Widget>[
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WebViewContainer(
                                  'https://www.wishfin.com/cibil-score')));
                    },
                    child: Text(
                      "Get it Now!",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    color: Colors.green,
                    minWidth: 300,
                  ),
                  Positioned(
                    top: -5.0,
                    right: 15.0,
                    child: new SizedBox(
                        height: 30.0,
                        width: 50.0,
                        child: Stack(
                          children: <Widget>[
                            Container(
                                height: 30.0,
                                width: 50.0,
                                child: new Image.asset(
                                  'assets/free_tag.png',
                                  color: Colors.redAccent,
                                  fit: BoxFit.fill,
                                )),
                            new Center(
                              child: new Text('Free',
                                  style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                      fontFamily: 'Ubuntu')),
                            )
                          ],
                        )),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
