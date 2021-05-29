import 'dart:async';

import 'package:csvsms/sentmessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Styles.dart';


class SplashScreen extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreen();
  }

}

class _SplashScreen extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => SentMessage()
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Hero(
            tag: 'heroLogo',
            child: Container(
                child: Icon(Icons.group_work,color: primaryColor,size: 64,)
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Hero(
            tag: '_csvmsgr',
            child: Material(
              color: Colors.transparent,
              child: Text(
                "CSV Messager",
                style: logoFontReg(fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: 8,),
          Material(
            color: Colors.transparent,
            child: Text(
              "Vardev Solutions",
              style: logoFontReg(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
