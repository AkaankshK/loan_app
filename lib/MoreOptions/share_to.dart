import 'package:flutter/material.dart';
import 'package:social_share/social_share.dart';

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

class ShareWith extends StatefulWidget {
  @override
  _ShareWith createState() => _ShareWith();
}

class _ShareWith extends State<ShareWith> {
  MaterialColor greenColor = MaterialColor(0xff01b527, colors);
  MaterialColor yellowColor = MaterialColor(0xffffa812, colors);
  MaterialColor lightBlueColor = MaterialColor(0xff3862ff, colors);
  MaterialColor darkBlueColor = MaterialColor(0xff0f3f81, colors);




  final key = GlobalKey<ScaffoldState>();

  String _platformVersion = 'Unknown';
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        backgroundColor: lightBlueColor,
        elevation: 0,
        title: Text("Share App"),
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


        MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          onPressed: () async {
            SocialShare.shareWhatsapp('This is the link to my app - ').then((value) => print(value));
          },
          minWidth: MediaQuery.of(context).size.width/1.5,
          color: yellowColor,
          child: Text("Share to WhatsApp",style: TextStyle(color: Colors.white)),

        ),

        Padding(padding: EdgeInsets.all(10.0),),

        MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          onPressed: () async {
            SocialShare.shareTelegram('This is the link to my app - ');
          },
          minWidth: MediaQuery.of(context).size.width/1.5,
          color: yellowColor,
          child: Text("Share to Telegram",style: TextStyle(color: Colors.white)),

        ),

        Padding(padding: EdgeInsets.all(10.0),),

        MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          onPressed: () async {
            SocialShare.shareTwitter('This is the link to my app - \n', url: '<Link will go down here>', trailingText: '\nDownload and enjoy');
          },
          minWidth: MediaQuery.of(context).size.width/1.5,
          color: yellowColor,
          child: Text("Share to Twitter",style: TextStyle(color: Colors.white)),

        ),

        Padding(padding: EdgeInsets.all(10.0),),

        MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          onPressed: () async {
            SocialShare.shareSms("This is the link to my app -",
                url: "\n<Link Will Go Here>",
                trailingText: "\nDownload and enjoy")
                .then((data) {
              print(data);
            });
          },
          minWidth: MediaQuery.of(context).size.width/1.5,
          color: yellowColor,
          child: Text("Share as SMS",style: TextStyle(color: Colors.white)),

        ),

        Padding(padding: EdgeInsets.all(10.0),),

        MaterialButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
          ),
          onPressed: () async {
            SocialShare.copyToClipboard('This the link to my app -').whenComplete(() => key.currentState.showSnackBar(SnackBar(content: Text('Copied to clipboard'), duration: Duration(seconds: 3),)));
          },
          minWidth: MediaQuery.of(context).size.width/1.5,
          color: yellowColor,
          child: Text("Copy to Clipboard",style: TextStyle(color: Colors.white)),

        ),

      ],
    );
  }




}




