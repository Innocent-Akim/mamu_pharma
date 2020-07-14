import 'package:bloc/bloc.dart';
import 'package:mamusoft/app/bloc/blocvente/eventVente.dart';
import 'package:mamusoft/app/bloc/blocvente/stateVente.dart';
import 'package:mamusoft/app/model/venteModel.dart';
import 'package:mamusoft/app/source/repository.dart';

class BlocVente extends Bloc<EventVente, StateVente> {
  @override
  StateVente get initialState => StateVenteInit();
  @override
  Stream<StateVente> mapEventToState(EventVente event) async* {
    if (event is EventVenteLoaded) {
      yield StateVenteLoading();

      List<ModelVente> vente = await Repository.getInstance()
          .fetchVente(entreprise: event.entreprise, limit: event.limit);

      yield StateVenteFetch(data: vente);
    }
  }
}
