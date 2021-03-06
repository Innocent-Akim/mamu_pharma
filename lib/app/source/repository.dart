import 'package:mamusoft/app/model/operationModel.dart';
import 'package:mamusoft/app/model/rapport_stock.dart';
import 'package:mamusoft/app/model/stockModel.dart';
import 'package:mamusoft/app/model/venteModel.dart';
import 'package:mamusoft/app/source/data_api_provider.dart';
import 'package:mamusoft/app/model/agent_model.dart';

class Repository {
  static Repository _instance;
  static Repository getInstance() {
    if (_instance == null) {
      _instance = Repository();
    }
    return _instance;
  }

  Future<List<ModelVente>> fetchVente(
          {String entreprise, String limit, String limitdb}) =>
      Dataprovider.getInstance()
          .fetchVente(entreprise: entreprise, limit: limit, limitdb: limitdb);

  Future<List<ModelStock>> getQte({String entreprise}) =>
      Dataprovider.getInstance().sumQuantite(entreprise: entreprise);

  Future<List<ModelRapport>> fetchFiche({String date, String entreprise}) =>
      Dataprovider.getInstance()
          .fetchFicheStock(date: date, entreprise: entreprise);

  Future<List<ModelRapport>> onChangedFiche(
          {String search, String entreprise, String date}) =>
      Dataprovider.getInstance().onChangeFicheStock(
          search: search, entreprise: entreprise, date: date);

  Future<List<ModelnbrOperation>> fetchOperatn(
          {String entreprise, String date, int position}) =>
      Dataprovider.getInstance().fetchOperation(
          date: date, entreprise: entreprise, position: position);

  Future<bool> sendAgent({ModelAgent agent}) =>
      Dataprovider.getInstance().sendAgent(agent);

  Future<List<ModelEntreprise>> fetchAngence() =>
      Dataprovider.getInstance().iscombox();
}
