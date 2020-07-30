import 'package:equatable/equatable.dart';
import 'package:mamusoft/app/model/agent_model.dart';

abstract class StateAgent extends Equatable {}

class StateInitAgent extends StateAgent {
  @override
  List<Object> get props => [];
}

class StateLoadingAgent extends StateAgent {
  @override
  List<Object> get props => [];
}

class StateLoadedAgent extends StateAgent {
  final ModelAgent agent;
  StateLoadedAgent({this.agent});
  @override
  List<Object> get props => [agent];
}
