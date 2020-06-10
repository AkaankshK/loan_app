

import 'package:flutter/material.dart';
import 'package:loanapp/Authentication/RegisterPage.dart';
import 'package:loanapp/Authentication/authentication.dart';
import 'package:loanapp/Authentication/page_select.dart';
import 'package:loanapp/MoreOptions/contact_us.dart';
import 'package:loanapp/MoreOptions/rate_us.dart';
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

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  MaterialColor greenColor = MaterialColor(0xff01b527, colors);
  MaterialColor yellowColor = MaterialColor(0xffffa812, colors);
  MaterialColor lightBlueColor = MaterialColor(0xff3862ff, colors);
  MaterialColor darkBlueColor = MaterialColor(0xff0f3f81, colors);
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
          child: Image.asset("assets/backk.png",fit: BoxFit.fill,),
        ),

        Align(
          alignment: Alignment(0,1),
          child: getList(),
        )
      ],
    );


  }

  getList() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height/1.5,
        child: ListView(
          children: [

            Center(
              child: new Text('You do not have any notifications right now.'),
            ),

          ],
        ),
      ),
    );
  }
}
