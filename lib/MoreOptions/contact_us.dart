import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
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
              Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(12.0),
                    height: _maxLines * 20.0,
                    child: new TextField(
                      maxLines: _maxLines,
                      decoration: InputDecoration(
                        hintText:
                            'Please describe your problem or suggestion in detail, we will follow up and solve it as soon as possible (recommended to add relevant screenshots)',
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20.0,
                    left: 0.0,
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: FlatButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.add,
                          size: 70.0,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              new TextField(
                decoration: InputDecoration(
                  hintText: 'Mobile Number',
                ),
                keyboardType: TextInputType.number,
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              new TextField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                height: 45.0,
                child: FlatButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        // return object of type Dialog
                        return AlertDialog(
                          title: new Text("Thank You !"),
                          content: new Text(
                              "We recieved your request and will get back to you soon.\n\nYou will hear from us soon."),
                          actions: <Widget>[
                            // usually buttons at the bottom of the dialog
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
