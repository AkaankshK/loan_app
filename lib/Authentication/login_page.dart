
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  MaterialColor greenColor = MaterialColor(0xff01b527, colors);
  MaterialColor yellowColor = MaterialColor(0xffffa812, colors);
  MaterialColor lightBlueColor = MaterialColor(0xff3862ff, colors);
  MaterialColor darkBlueColor = MaterialColor(0xff0f3f81, colors);

  bool checkBox = false;
  String phoneNo, verificationId, smsCode;
  bool codeSent = false;
  bool verified = false;
  final phoneNumController = TextEditingController();


  final key = GlobalKey<ScaffoldState>();

  final OTPSnackBar = SnackBar(
    content: Text("OTP Sent !"),
  );
  final OTPVerifiedSnackBar = SnackBar(
    content: Text("Phone Number Verified!"),
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        backgroundColor: lightBlueColor,
        elevation: 0,
        title: Text("Login"),
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
        SizedBox(
          height: 50,
          width: MediaQuery.of(context).size.width/1.5,
          child: TextField(
            controller: phoneNumController,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                prefixText: '+91',
                hintText: "Enter Your Mobile Number",
                prefixIcon: Image.asset("assets/ph.png",height: 40,width: 40,)
            ),
            keyboardType: TextInputType.number,
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
                suffix: FlatButton(
                    onPressed: () {
                      codeSent ? AuthService().signInWithOTP(smsCode, verificationId) :
                      verifyPhone("+91" + phoneNumController.text);
                      if(verified) {
                        print('Verified !!!');
                        key.currentState.showSnackBar(OTPVerifiedSnackBar);
                      }
                    },
                    child: codeSent ?
                    Text("Submit OTP Code",style: TextStyle(color: lightBlueColor)) :
                    Text("Get OTP Code",style: TextStyle(color: lightBlueColor))
                )
            ),
            keyboardType: TextInputType.number,
          ),
        ),
        SizedBox(height: 20,),
        MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          onPressed: () async {
            if(verified) {

//              print("User Verified");
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => NavBar()), (route) => false);
            }
//              print('Something Went Wrong');
              key.currentState.showSnackBar(SnackBar(content: new Text('Something Went Wrong, please try again later'), duration: Duration(seconds: 15),));

          },
          minWidth: MediaQuery.of(context).size.width/1.5,
          color: yellowColor,
          child: Text("Login to Get Loans",style: TextStyle(color: Colors.white)),

        ),



      ],
    );
  }


  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified = (AuthCredential authResult) {
      AuthService().signIn(authResult);
      setState(() {
        this.verified = true;
      });
    };

    final PhoneVerificationFailed verificationfailed =
        (AuthException authException) {
      print('${authException.message}');
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 60),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }

}




