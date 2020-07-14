import 'package:flutter/material.dart';
import 'package:mamusoft/screens/phone_verify.dart';
import 'package:mamusoft/util/mybottomnavbaritem.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _active = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        MyBottomNavBarItem(
          active: _active,
          id: 0,
          icon: Icons.widgets,
          text: "Home",
          function: () {
            setState(() {
              _active = 0;
              print("Accueil");
            });
          },
        ),
        MyBottomNavBarItem(
          active: _active,
          id: 1,
          icon: Icons.turned_in,
          text: "Stock",
          function: () {
            setState(() {
              _active = 1;
              print("Stock");
            });
          },
        ),
        MyBottomNavBarItem(
          active: _active,
          id: 2,
          icon: Icons.add_shopping_cart,
          text: "Caisse",
          function: () {
            setState(() {
              _active = 2;
              print("Profil");
            });
          },
        ),
        MyBottomNavBarItem(
          active: _active,
          id: 3,
          icon: Icons.person,
          text: "Profil",
          function: () {
            setState(() {
              _active = 3;
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => VerifyPage()));
            });
          },
        ),
      ],
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("My page"),
      ),
    );
  }
}
