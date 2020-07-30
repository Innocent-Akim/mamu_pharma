import 'package:bloc/bloc.dart';
import 'package:mamusoft/app/bloc/blocStock/eventStock.dart';
import 'package:mamusoft/app/bloc/blocStock/stateStock.dart';
import 'package:mamusoft/app/model/stockModel.dart';
import 'package:mamusoft/app/source/repository.dart';

class BlocStock extends Bloc<EventStock, StateStock> {
  @override
  StateStock get initialState => StateStockInit();

  @override
  Stream<StateStock> mapEventToState(EventStock event) async* {
    yield StateStockInit();
    if (event is EventStockerFetch) {
      List<ModelStock> stock =
          await Repository.getInstance().getQte(entreprise: event.entreprise);
      yield StateStockerFetch(data: stock);
    }
  }
}
