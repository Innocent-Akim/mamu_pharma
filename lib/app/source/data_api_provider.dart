import 'dart:convert';
import 'package:mamusoft/app/model/venteModel.dart';
import 'package:http/http.dart' as http;

class Dataprovider {
  static Dataprovider _instance;
  static bool isERROR = false;
  var resultat;
  static const path = "http://192.168.43.34:8081/solution/app/home/app.php";
  static Dataprovider getInstance() {
    if (_instance == null) {
      _instance = Dataprovider();
    }
    return _instance;
  }

  Future<List<ModelVente>> fetchVente({String entreprise, String limit}) async {
    try {
      List<ModelVente> vente = List();
      final reponse = await http.post(
        "$path",
        body: {
          'action': 'loadingVenteM',
          'limit': limit,
          'entreprise': entreprise,
        },
      );
      resultat = await json.decode(reponse.body);
      for (int index = 0; index < resultat.length; index++) {
        vente.add(ModelVente.fromJson(resultat[index]));
      }
      return vente;
    } catch (_) {
      isERROR = true;
    }
    return null;
  }
}

//chronogeologie quantite

enum init { action, loadingVenteM }
