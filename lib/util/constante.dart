import 'dart:io';
import 'package:flutter/material.dart';
import 'package:mamusoft/app/model/rapport_stock.dart';
import 'package:mamusoft/app/model/stockModel.dart';
import 'package:mamusoft/app/model/venteModel.dart';

class Constants {
  static String nameAgence;
  static ModelStock instance = ModelStock();
  static ModelVente caiiseInstance = ModelVente();
  static ModelRapport fiche = ModelRapport();
  static Constants _constants;
  static List<DropdownMenuItem<String>> list = [];
  static Constants getInstance() {
    if (_constants == null) {
      _constants = Constants();
    }
    return _constants;
  }

  static String capitalize({String val}) {
    return val.substring(0, 1) +
        "" +
        (val.toLowerCase()).substring(1, val.length);
  }

  Future<bool> connectionState() async {
    try {
      final resultat = await InternetAddress.lookup("www.google.com");
      if (resultat.isNotEmpty && resultat[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      print(_.toString());
      return false;
    }
    return false;
  }
}
