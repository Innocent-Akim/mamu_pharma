import 'package:flutter/material.dart';
import 'package:mamusoft/util/hotel_app_theme.dart';

class MyBottomNavBarItem extends StatelessWidget {
  final int id;
  final int active;
  final Function function;
  final String text;
  final IconData icon;
  const MyBottomNavBarItem(
      {Key key, this.active, this.function, this.id, this.text, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
        decoration: BoxDecoration(
          color: active == id
              ? HotelAppTheme.buildLightTheme().focusColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              color: active == id
                  ? HotelAppTheme.buildLightTheme().primaryColor
                  : HotelAppTheme.buildLightTheme().primaryColor,
            ),
            SizedBox(width: 5),
            active == id
                ? Text(
                    "$text",
                    style: TextStyle(
                        color: HotelAppTheme.buildLightTheme().primaryColor,
                        fontWeight: FontWeight.bold),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
