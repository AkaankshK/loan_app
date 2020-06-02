

import 'package:flutter/material.dart';
import 'package:loanapp/MoreOptions/RegisterPage.dart';
import 'package:loanapp/MoreOptions/contact_us.dart';
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
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
            ListTile(
              leading: Image.asset("assets/MoreOptions/1.png",height: 40,width: 40,),
              title: Text("My Credit Report"),
              trailing: Image.asset("assets/MoreOptions/back.png",height: 40,width: 40,),
            ),
            ListTile(
              leading: Image.asset("assets/MoreOptions/2.png",height: 40,width: 40,),
              title: Text("Settings"),
              trailing: Image.asset("assets/MoreOptions/back.png",height: 40,width: 40,),
            ),
            ListTile(
              leading: Image.asset("assets/MoreOptions/3.png",height: 40,width: 40,),
              title: Text("Rate Us"),
              trailing: Image.asset("assets/MoreOptions/back.png",height: 40,width: 40,),
            ),
            ListTile(
              leading: Image.asset("assets/MoreOptions/4.png",height: 40,width: 40,),
              title: Text("Share to your friends"),
              trailing: Image.asset("assets/MoreOptions/back.png",height: 40,width: 40,),
            ),
            ListTile(
              leading: Image.asset("assets/MoreOptions/5.png",height: 40,width: 40,),
              title: Text("Privacy Policy"),
              trailing: Image.asset("assets/MoreOptions/back.png",height: 40,width: 40,),
            ),
            ListTile(
              leading: Image.asset("assets/MoreOptions/6.png",height: 40,width: 40,),
              title: Text("Notifications"),
              trailing: Image.asset("assets/MoreOptions/back.png",height: 40,width: 40,),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) => ContactUs()));
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
