import 'package:bloc/bloc.dart';
import 'package:mamusoft/app/bloc/blocAgent/stateAgent.dart';
import 'package:mamusoft/app/bloc/blocOperation/operationEvent.dart';
import 'package:mamusoft/app/bloc/blocOperation/operationState.dart';
import 'package:mamusoft/app/model/operationModel.dart';
import 'package:mamusoft/app/source/repository.dart';

class OperationBloc extends Bloc<OperationEvent, OperationState> {
  @override
  OperationState get initialState => OperationStateInit();

  @override
  Stream<OperationState> mapEventToState(OperationEvent event) async* {
    try {
      yield OperationStateInit();
      if (event is OperationEventFetch) {
        yield OperationStateLoading();
        List<ModelnbrOperation> operation = await Repository.getInstance()
            .fetchOperatn(
                date: event.date,
                entreprise: event.entreprise,
                position: event.position);
        yield OperationStateLoaded(operation: operation);
      }
    } catch (_) {
      yield OperationStateError();
    }
  }
}

class BlocAgence extends Bloc<EventAgence, StateAgence> {
  @override
  StateAgence get initialState => StateInitAgence();

  @override
  Stream<StateAgence> mapEventToState(EventAgence event) async* {
    yield StateInitAgence();
    if (event is EventAgenceSelected) {
      yield StateLoadingAgence();
      List<ModelEntreprise> entreprise =
          await Repository.getInstance().fetchAngence();
      yield StateLoandedAgence(entreprise: entreprise);
    }
  }
}
