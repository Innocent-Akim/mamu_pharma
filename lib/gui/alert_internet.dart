import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mamusoft/screens/accueil.dart';
import 'package:mamusoft/screens/homepage.dart';
import 'package:mamusoft/util/constante.dart';

class AlertInternet extends StatefulWidget {
  _AlertInternet createState() => _AlertInternet();
}

class _AlertInternet extends State<AlertInternet> {
  bool connect = false;
  bool exist = true;
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await Constants.getInstance()
        .connectionState()
        .then((value) => connect = value);
  }

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
                child: customuse(onClic: () {
                  setState(() {
                    exist = !exist;
                  });
                  Future.delayed(Duration(seconds: 5)).then((value) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => connect
                              ? MyHomePage(
                                  quantite: Constants.instance.quantite,
                                  entreprise: "0001-KMGA",
                                )
                              : Accueil()),
                    );
                  });
                }),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Widget customuse({Function onClic}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 1,
        child: Container(
          height: MediaQuery.of(context).size.height / 2.5,
          width: MediaQuery.of(context).size.width / 1.2,
          color: Colors.black,
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
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 4,
              ),
              Material(
                elevation: 1,
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: onClic,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        exist
                            ? Icon(
                                Icons.refresh,
                                size: 30,
                                color: Colors.white,
                              )
                            : SpinKitCircle(
                                color: Colors.white,
                                size: 40,
                              ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width / 1.5,
                    height: MediaQuery.of(context).size.height / 16,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
