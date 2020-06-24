import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:image_picker/image_picker.dart';

class PreviousContactUs extends StatefulWidget {

  @override
  _PreviousContactUsState createState() => _PreviousContactUsState();
}

class _PreviousContactUsState extends State<PreviousContactUs> {
  String attachment;
  bool isHTML = false;
  // final _recipientController = TextEditingController();
  // final _subjectController = TextEditingController();
  final _bodyController = TextEditingController();
  final key = new GlobalKey<ScaffoldState>();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  String platformResponse;

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
                      controller: _bodyController,
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
                        onPressed: () => _openImagePicker,
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
                controller: _mobileController,
                decoration: InputDecoration(

                  hintText: 'Mobile Number',
                ),
                keyboardType: TextInputType.number,
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
                width: MediaQuery.of(context).size.width / 1.5,
                height: 45.0,
                child: FlatButton(
                  onPressed: () async {
                    sendMail();
                    // 
                    if(await platformResponse.compareTo('Success') == 0) {
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
                    }
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


  Future<void> sendMail() async {
    final Email email = Email(
      body: _bodyController.text,
      subject: 'Query from LoanKwik Contact Us form',
      recipients: ['azzamjafri98@gmail.com'],
      attachmentPaths: [attachment],
      isHTML: isHTML,
    );
    // 

    try{
      await FlutterEmailSender.send(email);
      platformResponse = 'Success';
    }catch(error) {
      platformResponse = error.toString();

    }
    if(!mounted) return;
    key.currentState.showSnackBar(SnackBar(content: Text(platformResponse)));
  }
  void _openImagePicker() async {
    File picked = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      // attachment.add(picked.path);
      attachment = picked.path;
    }); 
  }
}
