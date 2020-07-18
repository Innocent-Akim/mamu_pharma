import 'package:mamusoft/app/model/stockModel.dart';
import 'package:mamusoft/app/model/venteModel.dart';
import 'package:mamusoft/app/source/data_api_provider.dart';

class Repository {
  static Repository _instance;
  static Repository getInstance() {
    if (_instance == null) {
      _instance = Repository();
    }
    return _instance;
  }

  Future<List<ModelVente>> fetchVente({String entreprise, String limit}) =>
      Dataprovider.getInstance()
          .fetchVente(entreprise: entreprise, limit: limit);

  Future<List<ModelStock>> getQte({String entreprise}) =>
      Dataprovider.getInstance().sumQuantite(entreprise: entreprise);
}
