import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mamusoft/gui/alert_internet.dart';
import 'package:mamusoft/screens/homepage.dart';
import 'package:mamusoft/util/constante.dart';
import 'package:progress_dialog/progress_dialog.dart';

class Accueil extends StatefulWidget {
  static const String rootName = '/accueil';
  @override
  _Accueil createState() => _Accueil();
}

class _Accueil extends State<Accueil> {
  bool isprogress = false;
  ProgressDialog dialogueProgress;

  bool isOffline = false;
  bool connect = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await Constants.getInstance().connectionState().then((value) {
      connect = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    dialogueProgress = ProgressDialog(context);
    dialogueProgress.style(
        message: 'Please waiting...',
        borderRadius: 5.0,
        backgroundColor: Colors.white,
        progressWidget: SpinKitCircle(
          color: Colors.lightBlue,
          size: 50,
        ),
        elevation: 0.0,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w300),
        messageTextStyle: TextStyle(
            color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400));
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height / 1,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: Colors.white,
                          width: 1,
                          style: BorderStyle.none)),
                  child: Image.asset(
                    "assets/login.jpg",
                    // height: MediaQuery.of(context).size.height / 2,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 0, bottom: 16),
                      decoration: BoxDecoration(
                        color: Color(0xFF42A5F5),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      width: 250,
                      height: 45,
                      child: FlatButton(
                        child: Text('Sign in',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w300,
                                color: Colors.white)),
                        onPressed: () {
                          dialogueProgress.show();
                          Future.delayed(Duration(seconds: 5)).then((value) =>
                              dialogueProgress.hide().whenComplete(
                                  () => Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => !connect
                                                ? AlertInternet()
                                                : MyHomePage(
                                                    quantite: Constants
                                                        .instance.quantite,
                                                    entreprise: "0001-KMGA",
                                                  )),
                                      )));
                          FocusScope.of(context).requestFocus(FocusNode());

                          // Navigator.of(context).pushAndRemoveUntil(
                          //     MaterialPageRoute(builder: (builder) => MyHomePage()),
                          //     (Route<dynamic> route) => false);
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) => MyHomePage()));
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 0, bottom: 16),
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0xFF11C1EC)),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      width: 250,
                      height: 45,
                      child: FlatButton(
                        child: isprogress
                            ? SpinKitCircle(
                                color: Colors.lightBlue,
                                size: 50,
                              )
                            : Text('Sign up',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                  color: Color(0xFF11C1EC),
                                )),
                        onPressed: () {
                          setState(() {
                            isprogress = !isprogress;
                          });
                        },
                      ),
                    ),
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text("MAMU-SOFT",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 11)),
                          Text("Version 1.0.0",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 11)),
                          Text(
                            "Build by Databank RDC",
                            style: TextStyle(color: Colors.black, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
