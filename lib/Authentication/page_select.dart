import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loanapp/Authentication/RegisterPage.dart';
import 'package:loanapp/Authentication/login_page.dart';
import 'package:loanapp/NavigationBar/NavBar.dart';

import 'authentication.dart';

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

class PageSelector extends StatefulWidget {
  @override
  _PageSelectorState createState() => _PageSelectorState();
}

class _PageSelectorState extends State<PageSelector> {
  MaterialColor greenColor = MaterialColor(0xff01b527, colors);
  MaterialColor yellowColor = MaterialColor(0xffffa812, colors);
  MaterialColor lightBlueColor = MaterialColor(0xff3862ff, colors);
  MaterialColor darkBlueColor = MaterialColor(0xff0f3f81, colors);




  final key = GlobalKey<ScaffoldState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        backgroundColor: lightBlueColor,
        elevation: 0,
        title: Text("Login or Register"),
        centerTitle: true,
      ),
      body: getBody(),
    );
  }

  getBody() {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset("assets/b.png",fit: BoxFit.fill,),
          ),
          getContents(),

        ],
      ),
    );
  }

  getContents() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height/14.5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/LoanKwik Logo.png",height: 75,width: 75,),
          ],
        ),
        SizedBox(height: 20,),

        SizedBox(height: 20,),

        SizedBox(height: 20,),

        SizedBox(height: 20,),
        MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          onPressed: () async {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));

          },
          minWidth: MediaQuery.of(context).size.width/1.5,
          color: yellowColor,
          child: Text("Login to Get Loans",style: TextStyle(color: Colors.white)),

        ),

        Padding(padding: EdgeInsets.all(20.0),),
        MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          onPressed: () async {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterPage()));

          },
          minWidth: MediaQuery.of(context).size.width/1.5,
          color: yellowColor,
          child: Text("Register to Get Loans",style: TextStyle(color: Colors.white)),

        ),



      ],
    );
  }




}




