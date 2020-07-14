import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mamusoft/util/mybottomnavbar.dart';

class VerifyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _VerifyPageState();
  }
}

class _VerifyPageState extends State<VerifyPage> {
  String string = '';
  String code1 = '';
  String code2 = '';
  String code3 = '';
  String code4 = '';
  bool verify = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            brightness: Brightness.light,
            title: Text('Verification', style: TextStyle(color: Colors.black)),
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          body: ListView(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                //height: 300,
                decoration: BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black26,
                        offset: new Offset(0.0, 2.0),
                        blurRadius: 25.0,
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(32),
                        bottomRight: Radius.circular(32))),
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          _inputFields(code1),
                          _inputFields(code2),
                          _inputFields(code3),
                          _inputFields(code4),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 16, right: 16, top: 0),
                          child: OutlineButton(
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 8, bottom: 8),
                            textColor: Colors.red,
                            color: Colors.red,
                            borderSide: BorderSide(color: Colors.red),
                            child: Text(
                              'Resend',
                              style: TextStyle(),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              margin: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: verify ? Colors.green : Colors.grey,
                                shape: BoxShape.circle,
                              ),
                              child: IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  // Navigator.pushNamed(context, '/grocerry/home');
                                },
                                icon: Icon(Icons.check),
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _createCalcButton('1'),
                        _createCalcButton('2'),
                        _createCalcButton('3'),
                      ],
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _createCalcButton('4'),
                        _createCalcButton('5'),
                        _createCalcButton('6'),
                      ],
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _createCalcButton('7'),
                        _createCalcButton('8'),
                        _createCalcButton('9'),
                      ],
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _createCalcButton(''),
                        _createCalcButton('0'),
                        InkWell(
                            borderRadius: BorderRadius.circular(45),
                            onTap: () {
                              deleteCode();
                            },
                            child: Container(
                                alignment: Alignment.center,
                                // decoration: BoxDecoration(shape: BoxShape.circle),
                                width: MediaQuery.of(context).size.width *
                                    0.1 /
                                    1.5,
                                height: MediaQuery.of(context).size.height *
                                    0.1 /
                                    1.5,
                                child: Icon(Icons.backspace)))
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Widget _inputFields(String s) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.5 / 7,
      width: MediaQuery.of(context).size.width * 0.2,
      child: Text(
        s,
        style: TextStyle(fontSize: 28),
      ),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(8)),
    );
  }

  Widget _createCalcButton(String value) {
    return InkWell(
        borderRadius: BorderRadius.circular(45),
        onTap: () {
          updateCode(value);
        },
        child: Container(
          alignment: Alignment.center,
          // decoration: BoxDecoration(shape: BoxShape.circle),
          width: MediaQuery.of(context).size.width * 0.1 / 1.5,
          height: MediaQuery.of(context).size.height * 0.1 / 1.5,
          child: Text(
            value,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ));
  }

  void updateCode(String value) {
    switch (string.length) {
      case 0:
        {
          setState(() {
            code1 = value;
          });
          break;
        }
      case 1:
        {
          setState(() {
            code2 = value;
          });
          break;
        }
      case 2:
        {
          setState(() {
            code3 = value;
          });
          break;
        }
      case 3:
        {
          setState(() {
            code4 = value;
          });
          break;
        }
      default:
        {
          return;
        }
    }
    string += value;
    print(string);
    if (string.length > 3) {
      setState(() {
        verify = true;
      });
      return;
    } else {
      return;
    }
  }

  void deleteCode() {
    switch (string.length) {
      case 1:
        {
          setState(() {
            code1 = '';
          });
          break;
        }
      case 2:
        {
          setState(() {
            code2 = '';
          });
          break;
        }
      case 3:
        {
          setState(() {
            code3 = '';
          });
          break;
        }
      case 4:
        {
          setState(() {
            code4 = '';
          });
          break;
        }
      default:
        {
          return;
        }
    }
    string = string.substring(0, string.length - 1);
    if (string.length < 4) {
      setState(() {
        verify = false;
      });
    }
    print(string);
  }
}
