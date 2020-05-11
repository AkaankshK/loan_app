

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Map<int, Color> colors =
{
  50:Color.fromRGBO(136,14,79, .1),
  100:Color.fromRGBO(136,14,79, .2),
  200:Color.fromRGBO(136,14,79, .3),
  300:Color.fromRGBO(136,14,79, .4),
  400:Color.fromRGBO(136,14,79, .5),
  500:Color.fromRGBO(136,14,79, .6),
  600:Color.fromRGBO(136,14,79, .7),
  700:Color.fromRGBO(136,14,79, .8),
  800:Color.fromRGBO(136,14,79, .9),
  900:Color.fromRGBO(136,14,79, 1),
};


class CreditPage extends StatefulWidget {
  @override
  _CreditPageState createState() => _CreditPageState();
}

class _CreditPageState extends State<CreditPage> {
  MaterialColor yellow = MaterialColor(0xffde903b,colors);
  MaterialColor darkBlue = MaterialColor(0xff0f3f81,colors);
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
            child: Image.asset("assets/background1.png",fit: BoxFit.fill)),
        getContent(),
      ],
    );
  }

  getContent() {
    return SingleChildScrollView(
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text("Credit Report",style: TextStyle(fontSize: 25),),
              )
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30,left: 30),
                child: Text("Here is",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
              ),

            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text("Your ",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
              ),
              Text("Credit Report",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: yellow),)

            ],
          ),
          SizedBox(
            //TODO: Add text names
              height: 200,
              width: 700,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/u.png",height: 90,width: 200,),
                        Image.asset("assets/uu.png",height: 90,width: 200,),

                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset("assets/uuu.png",height: 90,width: 180,),
                        Image.asset("assets/uuuu.png",height: 90,width: 200,),

                      ],
                    ),
                  ]

              )
          ),
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            color: darkBlue,
            child: Center(
              child: Text("Ad for AdMob",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Image.asset("assets/p.png"),
              ),
              Text("Get Credit report for ",style: TextStyle(fontSize: 20),),
              Text("\u20b91500",style: TextStyle(fontSize: 20,decoration: TextDecoration.lineThrough),),
              Text(" FREE",style: TextStyle(fontSize: 20,color: Colors.red),),
            ],
          ),
          Row(
            children: [
              Image.asset("assets/fix-credit-score.png",height: 150,width: 200,),
              Image.asset("assets/creditscorestuff.jpg",height: 150,width: 200,),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                ),
                onPressed: (){},
                child: Text("Get it Now!",style: TextStyle(color: Colors.white,fontSize: 20),),
                color: Colors.green,
                minWidth: 300,
              )
            ],
          )
        ],
      ),
    );
  }
}
