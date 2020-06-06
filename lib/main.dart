import 'package:flutter/material.dart';
import 'package:loanapp/Authentication/authentication.dart';
import 'package:loanapp/IntroScreen/IntroScreen.dart';

void main() {
  runApp(MyApp());
}
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

class MyApp extends StatelessWidget {



  MaterialColor color = MaterialColor(0xff0f3f81,colors);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Loan Kwik',
      theme: ThemeData(
        primarySwatch: color,
      ),
//        home: MyHomePage(),
      home: AuthService().handleAuth(),
    );
  }
}


