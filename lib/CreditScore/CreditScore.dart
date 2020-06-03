import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          flex: 50,
                          child: AspectRatio(
                            aspectRatio: 4,
                            child: Image.asset(
                              "assets/u.png",
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
                flex:50,
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
                    onPressed: () {},
                    child: Text(
                      "Get it Now!",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    color: Colors.green,
                    minWidth: 300,
                  ),

                  Positioned(
                    right: 10.0,

//                      child: new Icon(Icons.mode_comment, size: 30.0, color: Colors.redAccent, semanticLabel: 'Free',)
                    child: ClipPath(
                      clipper: MyCustomClipPath(),

                      child: new Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.red,
                        ),
//                        color: Colors.red,
                          width: 70.0,
                          height: 50.0,
                        child: Center(child: new Text('Free', style: new TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),),
                          ),

                    ),
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

class MyCustomClipPath extends CustomClipper<Path> {

  var radius = 10.0;
  @override
  Path getClip(Size size) {
    final double startMargin = size.width / 6;
    final double x = size.width;
    final double y = size.height;
    final Path path = Path()
//    ..lineTo(startMargin, 0)
//      ..lineTo(startMargin, y / 2)
//      ..lineTo(0, y)
//      ..lineTo(x, y)
//      ..lineTo(x, 0)
//    ..close();
    ..lineTo(startMargin, 0)
    ..arcToPoint(Offset(startMargin, y / 2), radius: Radius.circular(15.0))
    ..arcToPoint(Offset(0, y - 10), radius: Radius.circular(15.0))
    ..arcToPoint(Offset(startMargin, y), radius: Radius.circular(15.0))
    ..lineTo(x, y)
    ..arcToPoint(Offset(x, 0), radius: Radius.circular(15.0))
    ..close();

    //    print('S1:$s1 SH:${size.height / 2} S2:$s2');
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;


}