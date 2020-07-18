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

  static Future<bool> connectionState() async {
    bool isbool = false;
    try {
      final resultat = await InternetAddress.lookup("http://www.google.com");
      if (resultat.isNotEmpty && resultat[0].rawAddress.isNotEmpty) {
        isbool = true;
      } else {
        isbool = false;
      }
    } on SocketException catch (_) {
      isbool = false;
    }
    return isbool;
  }
}
