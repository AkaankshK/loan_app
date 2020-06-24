import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ContactUs extends StatefulWidget {

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  String attachment;
  bool isHTML = false;
  
  
  final key = new GlobalKey<ScaffoldState>();


  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    const _maxLines = 10;
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: new Text(
          'Contact Us',
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: new Column(
            children: <Widget>[
              
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              new TextField(
                controller: _firstNameController,
                decoration: InputDecoration(

                  hintText: 'First name',
                ),
                
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              new TextField(
                controller: _lastNameController,
                decoration: InputDecoration(

                  hintText: 'Last name',
                ),
                
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              new TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),

              Container(
                margin: EdgeInsets.all(12.0),
                height: _maxLines * 10.0,
                child: new TextField(
                  controller: _messageController,
                  maxLines: _maxLines,
                  decoration: InputDecoration(
                    hintText:
                        'Please describe your problem or suggestion in detail, we will follow up and solve it as soon as possible.',
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0),),

              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: 45.0,
                child: FlatButton(
                  onPressed: () async {
                    
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        
                        return AlertDialog(
                          title: new Text("Thank You !"),
                          content: new Text(
                              "We recieved your request and will get back to you soon.\n\nYou will hear from us soon."),
                          actions: <Widget>[
                            
                            new FlatButton(
                              child: new Text("Close"),
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                    
                  },
                  child: new Text(
                    'Submit',
                    style: new TextStyle(color: Colors.white),
                  ),
                  shape: new RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  color: CupertinoColors.systemYellow,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  
}
