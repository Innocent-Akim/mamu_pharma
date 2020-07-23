import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  static const String rootName = '/login';
  @override
  _MyLogin createState() => _MyLogin();
}

class _MyLogin extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  isTextFormField(hintText: "Nom d'utilisateur"),
                  isTextFormField(hintText: "Mot de passé"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget isTextFormField({hintText}) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
        left: 15.0,
        right: 15.0,
        top: 8.0,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        elevation: 0.0,
        color: Colors.black.withOpacity(.1),
        child: Column(
          children: <Widget>[
            TextFormField(
              expands: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
