import 'package:equatable/equatable.dart';
import 'package:mamusoft/app/model/operationModel.dart';

abstract class OperationState extends Equatable {}

class OperationStateInit extends OperationState {
  @override
  List<Object> get props => [];
}

class OperationStateLoading extends OperationState {
  @override
  List<Object> get props => [];
}

class OperationStateLoaded extends OperationState {
  final List<ModelnbrOperation> operation;
  OperationStateLoaded({this.operation});
  @override
  List<Object> get props => [operation];
}

class OperationStateError extends OperationState {
  final message;
  OperationStateError({this.message});
  @override
  List<Object> get props => [message];
}

abstract class StateAgence extends Equatable {}

class StateInitAgence extends StateAgence {
  @override
  List<Object> get props => [];
}

class StateLoadingAgence extends StateAgence {
  @override
  List<Object> get props => [];
}

class StateLoandedAgence extends StateAgence {
  final List<ModelEntreprise> entreprise;
  StateLoandedAgence({this.entreprise});
  @override
  List<Object> get props => null;
}
