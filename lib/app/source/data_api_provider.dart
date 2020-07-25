import 'dart:convert';
import 'package:mamusoft/app/model/operationModel.dart';
import 'package:mamusoft/app/model/rapport_stock.dart';
import 'package:mamusoft/app/model/stockModel.dart';
import 'package:mamusoft/app/model/venteModel.dart';
import 'package:mamusoft/app/model/agent_model.dart';
import 'package:http/http.dart' as http;

class Dataprovider {
  static Dataprovider _instance;
  static bool isERROR = false;
  var resultat;
  static const path = "http://192.168.1.160:8081/solution/app/home/app.php";
  static Dataprovider getInstance() {
    if (_instance == null) {
      _instance = Dataprovider();
    }
    return _instance;
  }

  Future<List<ModelVente>> fetchVente(
      {String entreprise, String limit, String limitdb}) async {
    try {
      List<ModelVente> vente = List();
      final reponse = await http.post(
        "$path",
        body: {
          'action': 'loadingVenteM',
          'limit': limit,
          'entreprise': entreprise,
          'limitdb': limitdb,
        },
      );
      print("====================>  ${reponse.body}");
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

  Future<List<ModelStock>> sumQuantite({String entreprise}) async {
    try {
      List<ModelStock> vente = List();
      final repose = await http
          .post("$path", body: {'action': 'SUM_QTE', 'entreprise': entreprise});
      resultat = await json.decode(repose.body);
      if (!resultat.isEmpty) {
        vente.add(ModelStock.fromJson(resultat[0]));
      }
      return vente;
    } catch (_) {
      print(_.toString());
    }
    return null;
  }

  Future<List<ModelRapport>> fetchFicheStock(
      {String date, String entreprise}) async {
    List<ModelRapport> fiche = List();
    try {
      final reponse = await http.post("${path}", body: {
        'action': 'FICHE_STOCK_MOB',
        'date': date,
        'entreprise': entreprise
      });
      resultat = await json.decode(reponse.body);
      for (int index = 0; index < resultat.length; index++) {
        fiche.add(ModelRapport.fromJson(resultat[index]));
      }
      return fiche;
    } catch (_) {
      print("===========" + _.toString());
    }
    return null;
  }

  Future<List<ModelRapport>> onChangeFicheStock(
      {String search, String entreprise, String date}) async {
    List<ModelRapport> fiche = List();
    try {
      final reponse = await http.post("${path}", body: {
        'action': 'FICHE_SEARCH',
        'recherche': search,
        'entreprise': entreprise,
        'date': date
      });
      resultat = await json.decode(reponse.body);
      for (int index = 0; index < resultat.length; index++) {
        fiche.add(ModelRapport.fromJson(resultat[index]));
      }
      return fiche;
    } catch (_) {
      print(_.toString());
    }
    return null;
  }

  Future<List<ModelnbrOperation>> fetchOperation(
      {String date, String entreprise, int position}) async {
    List<ModelnbrOperation> operation = List();
    try {
      switch (position) {
        case 1:
          final responce = await http.post("$path", body: {
            'action': 'SORTI_DAY',
            'date': date,
            'entreprise': entreprise
          });
          resultat = await json.decode(responce.body);
          break;
        default:
          final responce = await http.post("$path", body: {
            'action': 'ENTRE_DAY',
            'date': date,
            'entreprise': entreprise
          });
          resultat = await json.decode(responce.body);
          break;
      }
      if (resultat != null) {
        operation.add(ModelnbrOperation.fromJson(resultat[0]));
      }
      return operation;
    } catch (_) {}
    return null;
  }

  Future<bool> sendAgent(ModelAgent agent) async {
    // var url = Uri.parse("$path");
    final responce = await http.post("$path", body: {
      'action': 'AGENT_ADD',
      'nom': agent.nom,
      'tel': agent.tel,
      'mail': agent.mail,
      'adress': agent.adress,
      'entreprise': agent.entreprise,
    });
    resultat = await json.decode(responce.body);
    print(resultat[0]['bool']);
    if (resultat[0]['bool'] == 'OK')
      return true;
    else
      return false;
  }

  Future<List<ModelEntreprise>> iscombox() async {
    List<ModelEntreprise> data = List();
    try {
      final response = await http.post("$path", body: {
        'action': 'AGENCE',
      });
      resultat = await json.decode(response.body);
      for (int index = 0; index < resultat.length; index++) {
        data.add(ModelEntreprise.fromJson(resultat[index]));
      }
      return data;
    } catch (_) {}
    return null;
  }
}
