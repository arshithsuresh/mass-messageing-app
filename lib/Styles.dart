import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AssetImage logo_sm = AssetImage('assets/logo-sm.png');
AssetImage bg_asset = AssetImage('assets/hacker.png');

Color primeTextColor = Color(0xFF54B37A);
Color primaryColor = Color(0xFF54B37A);
Color primaryActiveColor = Color(0xFF8CF4B6);
Color secondaryColor = Color(0xFFDB4949);
Color backgroundColor = Colors.black45;

TextStyle logoFontReg({double fontSize: 20}) => TextStyle(
    fontFamily: 'TypoHoop',
    fontWeight: FontWeight.w500,
    fontSize: fontSize,
    letterSpacing: 3,
    color: primeTextColor);

TextStyle logoFontBold({double fontSize: 20}) => TextStyle(
    fontFamily: 'TypoHoop',
    fontWeight: FontWeight.w800,
    fontSize: fontSize,
    letterSpacing: 3,
    color: primeTextColor);

TextStyle title1 = new TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w800,
    fontSize: 48,
    letterSpacing: 6,
    color: primeTextColor);

TextStyle subTitle1 = new TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w200,
    fontSize: 20,
    letterSpacing: 3,
    color: primeTextColor);

TextStyle infoTitle = new TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w200,
    fontSize: 16,
    letterSpacing: 3,
    color: primeTextColor);

TextStyle smallText12 = new TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w200,
    fontSize: 12,
    letterSpacing: 3,
    color: primeTextColor);

TextStyle inputTextLogin = new TextStyle(
  color: primeTextColor,
  decorationColor: secondaryColor,
);

InputDecoration inputBoxLogin(String _hintText, IconData _icon) =>
    new InputDecoration(
        hintText: _hintText,
        labelText: _hintText,
        focusColor: secondaryColor,
        prefixIcon: Icon(
          _icon,
          color: primaryColor,
        ),
        labelStyle: inputTextLogin,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: primaryColor, width: 3)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(22)),
            borderSide: BorderSide(color: primaryActiveColor, width: 3)));

InputDecoration textAreaNoIcon(String _hintText) =>
    new InputDecoration(
        hintText: _hintText,
        labelText: _hintText,
        focusColor: secondaryColor,
        labelStyle: inputTextLogin,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide(color: primaryColor, width: 3)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(22)),
            borderSide: BorderSide(color: primaryActiveColor, width: 3)));

//Buttons

FlatButton primaryButton(String text, Function onPressed) => FlatButton(
      child: Text(
        text,
        style: TextStyle(fontSize: 20, fontFamily: 'TypoHoop'),
      ),
      color: primaryColor,
      splashColor: primaryActiveColor,
      padding: EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      onPressed: onPressed,
    );

FlatButton secondaryButton(String text, Function onPressed) => FlatButton(
  child: Text(
    text,
    style: TextStyle(fontSize: 20, fontFamily: 'TypoHoop'),
  ),
  color: secondaryColor,
  splashColor: primaryActiveColor,
  padding: EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
  onPressed: onPressed,
);

FlatButton infoButton(String text, Function onPressed) => FlatButton(
  child: Text(
    text,
    style: TextStyle(fontSize: 20, fontFamily: 'TypoHoop', color: primaryColor),
  ),
  color: Colors.transparent,
  splashColor: primaryActiveColor,
  padding: EdgeInsets.only(top: 12, bottom: 12, left: 20, right: 20),
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),side: BorderSide(color: primaryColor)),
  onPressed: onPressed,
);

ShapeDecoration userProfileTile = ShapeDecoration(
  shape: RoundedRectangleBorder(
    side: BorderSide(
      color: primaryColor,
      width: 3.0,
      style: BorderStyle.solid,
    ),
    borderRadius: BorderRadius.all(Radius.circular(36)),
  ),
);

ShapeDecoration userProfileTileFilled = ShapeDecoration(
  color: primaryColor,
  shape: RoundedRectangleBorder(
    side: BorderSide(
      color: primaryColor,
      width: 3.0,
      style: BorderStyle.solid,
    ),
    borderRadius: BorderRadius.all(Radius.circular(36)),
  ),
);

final lockedStatus = Icon(
  Icons.lock,
  color: secondaryColor,
);

final correctStatus = Icon(
  Icons.lock_open,
  color: primaryActiveColor,
);

final incorrectStatus =Icon(
  Icons.block,
  color: secondaryColor,
);