

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

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  MaterialColor greenColor = MaterialColor(0xff01b527, colors);
  MaterialColor yellowColor = MaterialColor(0xffffa812, colors);
  MaterialColor lightBlueColor = MaterialColor(0xff3862ff, colors);
  MaterialColor darkBlueColor = MaterialColor(0xff0f3f81, colors);

  bool checkBox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightBlueColor,
        elevation: 0,
        title: Text("Registration"),
        centerTitle: true,
      ),
      body: getBody(),
    );
  }

  getBody() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset("assets/b.png",fit: BoxFit.fill,),
        ),
        getContents(),

      ],
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
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width/1.5,
          child: TextField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                hintText: "User Name",
                prefixIcon: Image.asset("assets/userhead.png",height: 40,width: 40,)
            ),
          ),
        ),
        SizedBox(height: 20,),
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width/1.5,
          child: TextField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                hintText: "Enter Your Mobile Number",
                prefixIcon: Image.asset("assets/ph.png",height: 40,width: 40,)
            ),
          ),
        ),
        SizedBox(height: 20,),
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width/1.5,
          child: TextField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                hintText: "The OTP Code",
                prefixIcon: Image.asset("assets/mess.png",height: 40,width: 40,),
               suffix: Text("Get OTP Code",style: TextStyle(color: lightBlueColor))
            ),
          ),
        ),
        SizedBox(height: 20,),
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          ),
          onPressed: (){},
          minWidth: MediaQuery.of(context).size.width/1.5,
          color: yellowColor,
          child: Text("Register to Get Loans",style: TextStyle(color: Colors.white)),

        ),

        CheckboxListTile(
          value: checkBox,
          onChanged: (newValue) {
            setState(() {
              checkBox = newValue;
            });
          },
          title: Row(
            children: [
              Text("I Agree to ",style: TextStyle(color: Colors.black)),
              Expanded(child: Text("TERM AND CONDITIONS PRIVACY POLICY",style: TextStyle(color: lightBlueColor, fontSize: 12.0),))
            ],
          ),
          controlAffinity: ListTileControlAffinity.leading,
          checkColor: Colors.white,
          activeColor: Colors.blueGrey,
        ),

      ],
    );
  }
}
