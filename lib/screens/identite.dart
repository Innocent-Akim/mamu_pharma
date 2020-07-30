import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mamusoft/app/source/repository.dart';
import 'package:mamusoft/custom_drawer/dopdown.dart';
import 'package:mamusoft/main.dart';
import 'package:mamusoft/util/constante.dart';
import 'package:mamusoft/util/design_course_app_theme.dart';
import 'package:mamusoft/app/model/agent_model.dart';

class MyIdentite {
  ModelAgent agent;
  bool isbool;
  TextEditingController nom = TextEditingController();
  TextEditingController tel = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController adresse = TextEditingController();
  final _globalKey = GlobalKey<FormState>();
  showDialogue(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Stack(
              overflow: Overflow.visible,
              children: <Widget>[
                Positioned(
                  right: -40,
                  top: -40,
                  child: InkResponse(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.redAccent,
                      child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Form(
                    key: _globalKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: 64,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: HexColor('#F8FAFB'),
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(13.0),
                                  bottomLeft: Radius.circular(13.0),
                                  topLeft: Radius.circular(13.0),
                                  topRight: Radius.circular(13.0),
                                ),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: SizedBox(
                                      height: 60,
                                      child: Icon(Icons.person,
                                          color: HexColor('#B9BABC')),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 8),
                                      child: TextFormField(
                                        controller: nom,
                                        style: TextStyle(
                                          fontFamily: 'WorkSans',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color:
                                              DesignCourseAppTheme.nearlyBlue,
                                        ),
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          labelText: 'Saisissez votre nom',
                                          hintText:
                                              'Saisissez votre nom complet',
                                          border: InputBorder.none,
                                          helperStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: HexColor('#B9BABC'),
                                          ),
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            letterSpacing: 0.2,
                                            color: HexColor('#B9BABC'),
                                          ),
                                        ),
                                        onEditingComplete: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: 64,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: HexColor('#F8FAFB'),
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(13.0),
                                  bottomLeft: Radius.circular(13.0),
                                  topLeft: Radius.circular(13.0),
                                  topRight: Radius.circular(13.0),
                                ),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: SizedBox(
                                      height: 60,
                                      child: Icon(Icons.add_call,
                                          color: HexColor('#B9BABC')),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 8),
                                      child: TextFormField(
                                        controller: tel,
                                        style: TextStyle(
                                          fontFamily: 'WorkSans',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color:
                                              DesignCourseAppTheme.nearlyBlue,
                                        ),
                                        keyboardType: TextInputType.phone,
                                        decoration: InputDecoration(
                                          labelText: 'Saisissez votre numéro',
                                          hintText: '+243 ***',
                                          border: InputBorder.none,
                                          helperStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: HexColor('#B9BABC'),
                                          ),
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            letterSpacing: 0.2,
                                            color: HexColor('#B9BABC'),
                                          ),
                                        ),
                                        onEditingComplete: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: 64,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: HexColor('#F8FAFB'),
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(13.0),
                                  bottomLeft: Radius.circular(13.0),
                                  topLeft: Radius.circular(13.0),
                                  topRight: Radius.circular(13.0),
                                ),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: SizedBox(
                                      height: 60,
                                      child: Icon(Icons.email,
                                          color: HexColor('#B9BABC')),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 8),
                                      child: TextFormField(
                                        controller: mail,
                                        style: TextStyle(
                                          fontFamily: 'WorkSans',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color:
                                              DesignCourseAppTheme.nearlyBlue,
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          labelText: 'Saisissez votre mail',
                                          hintText:
                                              'Depotpharmaceutique@gmail.com',
                                          border: InputBorder.none,
                                          helperStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: HexColor('#B9BABC'),
                                          ),
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            letterSpacing: 0.2,
                                            color: HexColor('#B9BABC'),
                                          ),
                                        ),
                                        onEditingComplete: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: 64,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: HexColor('#F8FAFB'),
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(13.0),
                                  bottomLeft: Radius.circular(13.0),
                                  topLeft: Radius.circular(13.0),
                                  topRight: Radius.circular(13.0),
                                ),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: SizedBox(
                                      height: 60,
                                      child: Icon(Icons.map,
                                          color: HexColor('#B9BABC')),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 8),
                                      child: TextFormField(
                                        controller: adresse,
                                        style: TextStyle(
                                          fontFamily: 'WorkSans',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color:
                                              DesignCourseAppTheme.nearlyBlue,
                                        ),
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          labelText: 'Saisissez votre adresse',
                                          hintText: 'RDC Sud-Kivu Bukavu',
                                          border: InputBorder.none,
                                          helperStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12,
                                            color: HexColor('#B9BABC'),
                                          ),
                                          labelStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            letterSpacing: 0.2,
                                            color: HexColor('#B9BABC'),
                                          ),
                                        ),
                                        onEditingComplete: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          height: 64,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: HexColor('#F8FAFB'),
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(13.0),
                                  bottomLeft: Radius.circular(13.0),
                                  topLeft: Radius.circular(13.0),
                                  topRight: Radius.circular(13.0),
                                ),
                              ),
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: SizedBox(
                                      height: 60,
                                      child: Icon(Icons.home,
                                          color: HexColor('#B9BABC')),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 8),
                                      child: CustomDropDwon(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: InkWell(
                            onTap: () async {
                              if (nom.text.isEmpty ||
                                  tel.text.isEmpty ||
                                  mail.text.isEmpty ||
                                  adresse.text.isEmpty ||
                                  Constants.nameAgence.isEmpty) {
                                print("Champs vide");
                              } else {
                                agent = ModelAgent(
                                    nom: nom.text.toUpperCase().trim(),
                                    tel: tel.text.trim(),
                                    mail: mail.text.trim(),
                                    adress: adresse.text.toUpperCase().trim(),
                                    entreprise: Constants.nameAgence
                                        .toUpperCase()
                                        .trim());

                                isbool = await Repository.getInstance()
                                    .sendAgent(agent: agent);
                                if (isbool) {
                                  Future.delayed(Duration(seconds: 1))
                                      .then((value) {
                                    init();
                                  });
                                }
                              }
                              // blocAgent.add(EventsendAgent(agent: agent));
                            },
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFF11C1EC)),
                              child: isbool
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(
                                          Icons.group_add,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          "Enregistrer",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w300),
                                        )
                                      ],
                                    )
                                  : SpinKitCircle(
                                      color: Colors.white,
                                      size: 20,
                                    ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  void init() {
    nom.clear();
    tel.clear();
    adresse.clear();
    mail.clear();
  }
}
