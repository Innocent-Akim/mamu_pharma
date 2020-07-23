import 'package:equatable/equatable.dart';
import 'package:mamusoft/app/model/operationModel.dart';

abstract class OperationEvent extends Equatable {}

class OperationEventFetch extends OperationEvent {
  final date;
  final entreprise;
  final position;
  OperationEventFetch({this.date, this.entreprise, this.position});
  @override
  List<Object> get props => [date, entreprise, position];
}

abstract class EventAgence extends Equatable {}

class EventAgenceFetch extends EventAgence {
  final List<ModelEntreprise> entreprise;
  EventAgenceFetch({this.entreprise});
  @override
  List<Object> get props => [];
}

class EventAgenceSelected extends EventAgence {
  @override
  List<Object> get props => [];
}

class EventAgenceFetchAll extends EventAgence {
  @override
  List<Object> get props => [];
}
