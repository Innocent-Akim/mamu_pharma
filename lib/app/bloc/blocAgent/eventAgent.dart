import 'package:equatable/equatable.dart';
import 'package:mamusoft/app/model/agent_model.dart';

abstract class Eventagent extends Equatable {}

class EventsendAgent extends Eventagent {
  final ModelAgent agent;
  EventsendAgent({this.agent});
  @override
  List<Object> get props => [agent];
}
