import 'dart:io';
import 'package:mamusoft/app/model/stockModel.dart';
import 'package:mamusoft/app/model/venteModel.dart';

class Constants {
  static ModelStock instance = ModelStock();
  static ModelVente caiiseInstance = ModelVente();
  static Constants _constants;
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

  static Future<bool> connectionState() async {
    try {
      final resultat = await InternetAddress.lookup("http://www.google.com");
      if (resultat.isNotEmpty && resultat[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
}
