import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mamusoft/screens/homepage.dart';
import 'package:mamusoft/util/constante.dart';

class AlertInternet extends StatefulWidget {
  _AlertInternet createState() => _AlertInternet();
}

class _AlertInternet extends State<AlertInternet> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.white,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 1,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 3,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Vous n’êtes pas connecté",
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          Image.asset(
                            "assets/internet.png",
                            width: MediaQuery.of(context).size.width / 1.5,
                            height: 150,
                          ),
                          Material(
                            child: Container(
                                color: Colors.white,
                                child: FlatButton(
                                    colorBrightness: Brightness.dark,
                                    color: Color(0xFF5DAEFF),
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => MyHomePage(
                                                  quantite: Constants
                                                      .instance.quantite,
                                                  entreprise: "0001-KMGA",
                                                )),
                                      );
                                    },
                                    child: Icon(
                                      Icons.refresh,
                                      color: Colors.white,
                                    ))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
