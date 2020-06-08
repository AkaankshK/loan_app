import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loanapp/Authentication/page_select.dart';
import 'package:loanapp/IntroScreen/IntroScreen.dart';
import 'package:loanapp/NavigationBar/NavBar.dart';

class  AuthService {

  handleAuth() {

    return StreamBuilder(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (BuildContext context, snapshot) {
        if(snapshot.hasData) {
          return NavBar();
        }else{
          return IntroScreen();
        }
      },
    );
  }



  signOut() {
    FirebaseAuth.instance.signOut();
  }

  signIn(AuthCredential authCredential) {
    FirebaseAuth.instance.signInWithCredential(authCredential);
  }

  signInWithOTP(smsCode, verificationId) {
    try{
      AuthCredential authCredential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: smsCode);
      signIn(authCredential);
    }catch(Exception) {
      print(Exception.toString() + "....................");
    }
  }

}