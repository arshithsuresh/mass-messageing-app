import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:csvsms/Styles.dart' as prefix0;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:toast/toast.dart';
import 'Styles.dart';

class SentMessage extends StatefulWidget {
  @override
  _SentMessageState createState() => _SentMessageState();
}

class _SentMessageState extends State<SentMessage> {
  File csvFile;
  String fileName = "Choose File...";
  List<dynamic> Contacts;

  Map<String,String> _ContactMap;
  final txtMessage = new TextEditingController();
  Future<List<String>> Columns;

  String getname(String path) {
    return path.split("/").last;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(children: <Widget>[
        Positioned(
          bottom: 36,
          child: Image(
            image: bg_asset,
            color: Color(0x18FFFFFF),
            height: size.width*0.75,
            width: size.width,
            fit: BoxFit.contain,
          ),
        ),
        Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 28,
                ),
                Hero(
                  tag: 'heroLogo',
                  child: Container(
                      child: Icon(
                    Icons.group_work,
                    color: primaryColor,
                    size: 64,
                  )),
                ),
                SizedBox(
                  height: 20,
                ),
                Hero(
                  tag: '_csvmsgr',
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      "CSV Messenger",
                      style: logoFontReg(fontSize: 20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  "Upload CSV File",
                  style: logoFontReg(fontSize: 26),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      fileName,
                      style: prefix0.subTitle1,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.cloud_upload,
                        color: primaryColor,
                        size: 32,
                      ),
                      onPressed: () async {
                        int count = 0;
                        csvFile = await FilePicker.getFile(
                            type: FileType.CUSTOM, fileExtension: "csv");
                        if(csvFile ==null)
                          {
                            toastMessage(context, "Select a CSV File!");
                            return;
                          }
                        setState(() {
                          fileName = getname(csvFile.path);
                        });
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 36, right: 36, top: 8, bottom: 8),
                  child: TextField(
                    maxLines: 3,
                    style: TextStyle(color: primaryColor),
                    decoration: textAreaNoIcon("Message to Sent"),
                    controller: txtMessage,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                primaryButton("Send Message", _SentMessage),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 25,
          child: SizedBox(
            width: size.width,
            child: Center(

              child: Material(
                color: Colors.transparent,
                child: Text(
                  "Vardev Solutions",
                  style: logoFontReg(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }

  void CheckColoumns() async
  {

    final input = csvFile.openRead();
    Contacts = await input
        .transform(utf8.decoder)
        .transform(new CsvToListConverter())
        .toList();
    _ContactMap = Map.fromIterable(Contacts,
        key: (e) => e[0], value: (e) => e[1].toString());

    Columns =
  }

  void _SentMessage() async {
    int err=0;
    if (csvFile == null) {
      toastMessage(context, "Please select a csv file!");
      err++;
      return;
    }
    if (txtMessage.text.length < 2) {
      toastMessage(context, "Please enter a valid text message!");
      err++;
      return;
    }
    if(err==0) {


      Contacts.removeAt(0);
      int count = Contacts.length;
      toastMessage(context, "Contains $count contacts. Senting....");
      await Future.delayed(Duration(seconds: 3));
      sentMessage();
    }
  }

  void sentMessage() {

    List<String> numbers = _ContactMap.values.toList();
    _sendSMS(txtMessage.text, numbers);
  }

  void _sendSMS(String message, List<String> recipents) async {
    String _result =
        await FlutterSms.sendSMS(message: message, recipients: recipents)
            .catchError((onError) {
      print(onError);
    });
    print(_result);
  }

  void toastMessage(context, String message) {
    Toast.show(message, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  }
}
