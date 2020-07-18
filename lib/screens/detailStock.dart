import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:mamusoft/util/hotel_app_theme.dart';

class DetailStock extends StatefulWidget {
  const DetailStock({Key key, this.animation}) : super(key: key);

  _DetailStock createState() => _DetailStock();
  final Animation<dynamic> animation;
}

class _DetailStock extends State<DetailStock> {
  DatePickerController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HotelAppTheme.buildLightTheme().backgroundColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 1.0,
            backgroundColor: Colors.white,
            leading: IconButton(
                icon: Icon(Icons.close, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                child: customiseCalendrier(),
              ),
              Expanded(
                  child: ListView(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      cardDetail(),
                      cardDetail(),
                      cardDetail(),
                      cardDetail()
                    ],
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  // selectedTextColor: Colors.blue.shade200,
  //       selectionColor: Colors.blue.shade200,
  Widget customiseCalendrier() {
    return Column(
      children: <Widget>[
        Material(
          color: Colors.white,
          elevation: 0.0,
          child: DatePicker(
            DateTime.now(),
            controller: controller,
            locale: 'fr_FR',
            initialSelectedDate: DateTime.now(),
            selectedTextColor: Colors.redAccent,
            dateTextStyle: TextStyle(
                color: Color(0xFF42A5F5),
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
            onDateChange: (date) {
              setState(() {
                print(date);
              });
            },
          ),
        )
      ],
    );
  }

  Widget cardDetail(
      {String designation,
      String sInitialer,
      String sDisponiler,
      String sVendus,
      String mTotal,
      String date}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: HotelAppTheme.buildLightTheme().backgroundColor,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                offset: const Offset(0, 2),
                blurRadius: 4.0),
          ],
        ),
        child: Material(
          elevation: 0.5,
          color: Color(0xFFF9FEFF),
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Color(0xEAFFFFFF), width: 1)),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(
                                      color: Colors.black, width: 1)),
                              child: Center(
                                  child: Icon(
                                Icons.widgets,
                                color: Colors.black,
                              )),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Doctor Maison",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 18)),
                          ],
                        )),
                    Container(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1,
                                )),
                            child: Center(
                                child: Icon(
                              Icons.playlist_add_check,
                              color: Colors.black,
                            )),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("245",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30)),
                        ],
                      ),
                    ))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          border:
                              Border.all(color: Color(0xFF42A5F5), width: 1)),
                      child: Center(
                        child: Icon(Icons.gavel, color: Color(0xFF42A5F5)),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Rapport des ventes",
                      style: TextStyle(
                          color: Color(0xFF42A5F5),
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.call_missed_outgoing, color: Colors.black),
                        Text(
                          "Disponible",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.call_missed_outgoing, color: Colors.black),
                        Text(
                          "Vendus",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.call_missed_outgoing, color: Colors.white),
                        Text(
                          "Montant",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  child: Text(""),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.trending_down, color: Colors.black),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "250",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.trending_up, color: Colors.black),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "250",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.attach_money, color: Colors.black),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          "250",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 8, top: 0, bottom: 0),
                      child: Material(
                        child: Text("2020-02-25"),
                      ),
                    ),
                  ],
                ),
                IconButton(icon: Icon(Icons.input), onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
