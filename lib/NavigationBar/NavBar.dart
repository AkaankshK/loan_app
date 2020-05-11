

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loanapp/Calculator/Calculator.dart';
import 'package:loanapp/CreditScore/CreditScore.dart';
import 'package:loanapp/HomeScreen/HomeScreen.dart';
import 'package:loanapp/MoreOptions/MoreOptionsPage.dart';
import 'package:loanapp/dummy.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var currentIndex=0;
  final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    DummyPage(),
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                minWidth: 40,
                onPressed: (){
                  setState(() {
                    currentIndex=0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/money bag icon.png",height: 30,width: 30,),
                    Text("LoanKwik")
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: (){
                  setState(() {
                    currentIndex=1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/ol.png",height: 30,width: 30,),
                    Text("Offer")
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20),
                child: Text("Credit Score"),
              ),

              MaterialButton(
                minWidth: 40,
                onPressed: (){
                  setState(() {
                    currentIndex=3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/calcicon.png",height: 30,width: 30,),
                    Text("Calculator")
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: (){
                  setState(() {
                    currentIndex=4;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/ii.png",height: 30,width: 30,),
                    Text("More")
                  ],
                ),
              ),
            ],
          ),
        ),


      ),
    );
  }
}
