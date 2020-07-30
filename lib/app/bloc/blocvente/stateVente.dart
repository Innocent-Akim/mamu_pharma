import 'package:equatable/equatable.dart';
import 'package:mamusoft/app/model/venteModel.dart';

abstract class StateVente extends Equatable {}

class StateVenteInit extends StateVente {
  @override
  List<Object> get props => [];
}

class StateVenteLoading extends StateVente {
  @override
  List<Object> get props => null;
}

// ignore: must_be_immutable
class StateVenteFetch extends StateVente {
  List<ModelVente> data;
  StateVenteFetch({this.data});
  @override
  List<Object> get props => [];
}

class StateVentePagineted extends StateVente {
  List<ModelVente> data;
  StateVentePagineted({this.data});
  @override
  List<Object> get props => [];
}
