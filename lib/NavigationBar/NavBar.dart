

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loanapp/Calculator/Calculator.dart';
import 'package:loanapp/CreditScore/CreditScore.dart';
import 'package:loanapp/HomeScreen/HomeScreen.dart';
import 'package:loanapp/MoreOptions/MoreOptionsPage.dart';
import 'package:loanapp/dummy.dart';
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
class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  MaterialColor freeColor = MaterialColor(0xff01b527,colors);
  MaterialColor buttonColor = MaterialColor(0xffffa812,colors);
  MaterialColor lightBlueColor = MaterialColor(0xff3862ff,colors);
  var currentIndex=0;
  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HomeScreen(),
   CreditPage(),
    Calculator(),
    MoreOptionsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Image.asset("assets/credit score icon.png",height: 80,width: 80,),
        onPressed: (){
          setState(() {
            currentIndex=2;
          });
        },
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _widgetOptions[currentIndex],
      bottomNavigationBar:BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 0,
        child: Container(
          height: 60,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 20,
                child: MaterialButton(
                  onPressed: (){
                    setState(() {
                      currentIndex=0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/money bag icon.png",height: 30,width: 30,color: currentIndex==0?lightBlueColor: Colors.black,),
                      Text("LoanKwik",style: TextStyle(color:currentIndex==0?lightBlueColor: Colors.black,fontSize: 10),)
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 20,
                child: MaterialButton(
                  onPressed: (){
                    setState(() {
                      currentIndex=1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/ol.png",height: 30,width: 30,color: currentIndex==1?lightBlueColor: Colors.black),
                      Text("Offer",style: TextStyle(color:currentIndex==1?lightBlueColor: Colors.black,fontSize: 10))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 20,
                child: Padding(
                  padding: const EdgeInsets.only(top:20),
                  child: Text("Credit Score"),
                ),
              ),

              Expanded(
                flex: 20,
                child: MaterialButton(

                  onPressed: (){
                    setState(() {
                      currentIndex=3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/calcicon.png",height: 30,width: 30,color:currentIndex==3?lightBlueColor: Colors.black),
                      Text("Calculator",style: TextStyle(color:currentIndex==3?lightBlueColor: Colors.black,fontSize: 10))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 20,
                child: MaterialButton(

                  onPressed: (){
                    setState(() {
                      currentIndex=4;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/ii.png",height: 30,width: 30,color:currentIndex==4?lightBlueColor: Colors.black),
                      Text("More",style: TextStyle(color:currentIndex==4?lightBlueColor: Colors.black,fontSize: 10))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),


      ),
    );
  }
}
