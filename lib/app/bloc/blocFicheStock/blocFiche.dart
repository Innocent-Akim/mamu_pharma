import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mamusoft/app/bloc/blocFicheStock/eventFiche.dart';
import 'package:mamusoft/app/bloc/blocFicheStock/stateFiche.dart';
import 'package:mamusoft/app/model/rapport_stock.dart';
import 'package:mamusoft/app/source/repository.dart';

class BlocFiche extends Bloc<EventFiche, StateFiche> {
  @override
  StateFiche get initialState => StateFicheInit();

  @override
  Stream<StateFiche> mapEventToState(EventFiche event) async* {
    try {
      yield StateFicheInit();
      if (event is EventFicheFetch) {
        yield StateFicheLoading();
        List<ModelRapport> fiche = await Repository.getInstance()
            .fetchFiche(date: event.date, entreprise: event.entreprise);
        yield SteteFicheLoaded(fiche: fiche);
      }
    } catch (_) {
      print(_.toString());
    }
  }
}
