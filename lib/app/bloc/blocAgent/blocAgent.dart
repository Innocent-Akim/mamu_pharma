import 'package:bloc/bloc.dart';
import 'package:mamusoft/app/bloc/blocAgent/eventAgent.dart';
import 'package:mamusoft/app/bloc/blocAgent/stateAgent.dart';
import 'package:mamusoft/app/model/agent_model.dart';
import 'package:mamusoft/app/source/repository.dart';

class BlocAgent extends Bloc<Eventagent, StateAgent> {
  @override
  StateAgent get initialState => StateInitAgent();

  @override
  Stream<StateAgent> mapEventToState(Eventagent event) async* {
    yield StateInitAgent();
    if (event is EventsendAgent) {
      yield StateLoadingAgent();
      bool resultat =
          await Repository.getInstance().sendAgent(agent: event.agent);
      if (resultat) {
        print("Enregistrement réussi");
      }
    }
  }
}
