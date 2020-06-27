

import 'package:flutter/material.dart';
import 'package:loanapp/Authentication/page_select.dart';
import 'package:loanapp/MoreOptions/notifications.dart';
import 'package:loanapp/MoreOptions/rate_us.dart';
import 'package:loanapp/MoreOptions/settings.dart';
import 'package:loanapp/MoreOptions/share_to.dart';
import 'package:loanapp/web_view_container.dart';

import 'ads.dart';
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

class MoreOptionsPage extends StatefulWidget {
  @override
  _MoreOptionsPageState createState() => _MoreOptionsPageState();
}

class _MoreOptionsPageState extends State<MoreOptionsPage> {
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
          alignment: Alignment(0,-.6),
          
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            color: yellowColor,
            child: Text("Login",style: TextStyle(color: Colors.white),),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => PageSelector()));
              // Navigator.push(context, MaterialPageRoute(builder: (context) => ADS()));
            },

          ),
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
            FlatButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewContainer('https://www.wishfin.com/cibil-score')));
              },
              child: ListTile(
                leading: Image.asset("assets/MoreOptions/1.png",height: 40,width: 40,),
                title: Text("My Credit Report"),
                trailing: Image.asset("assets/MoreOptions/back.png",height: 40,width: 40,),
              ),
            ),
            FlatButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Settings()));
              },
              child: ListTile(
                leading: Image.asset("assets/MoreOptions/2.png",height: 40,width: 40,),
                title: Text("Settings"),
                trailing: Image.asset("assets/MoreOptions/back.png",height: 40,width: 40,),
              ),
            ),
            FlatButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => RateUs()));
              },
              child: ListTile(
                leading: Image.asset("assets/MoreOptions/3.png",height: 40,width: 40,),
                title: Text("Rate Us"),
                trailing: Image.asset("assets/MoreOptions/back.png",height: 40,width: 40,),
              ),
            ),
            FlatButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => ShareWith()));
              },
              child: ListTile(
                leading: Image.asset("assets/MoreOptions/4.png",height: 40,width: 40,),
                title: Text("Share to your friends"),
                trailing: Image.asset("assets/MoreOptions/back.png",height: 40,width: 40,),
              ),
            ),
            FlatButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => WebViewContainer('https://loankwikprivacypolicy.blogspot.com/')));
              },
              child: ListTile(
                leading: Image.asset("assets/MoreOptions/5.png",height: 40,width: 40,),
                title: Text("Privacy Policy"),
                trailing: Image.asset("assets/MoreOptions/back.png",height: 40,width: 40,),
              ),
            ),
            FlatButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications()));
              },
              child: ListTile(
                leading: Image.asset("assets/MoreOptions/6.png",height: 40,width: 40,),
                title: Text("Notifications"),
                trailing: Image.asset("assets/MoreOptions/back.png",height: 40,width: 40,),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => WebViewContainer('https://loankwika.blogspot.com')));
              },
              child: ListTile(
                leading: Image.asset("assets/MoreOptions/7.png",height: 40,width: 40,),
                title: Text("Contact Us"),
                trailing: Image.asset("assets/MoreOptions/back.png",height: 40,width: 40,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
