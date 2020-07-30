import 'package:equatable/equatable.dart';
import 'package:mamusoft/app/model/stockModel.dart';

abstract class StateStock extends Equatable {}

class StateStockInit extends StateStock {
  List<Object> get props => [];
}

class StateStockerLoading extends StateStock {
  @override
  List<Object> get props => [];
}

class StateStockerFetch extends StateStock {
  final List<ModelStock> data;
  StateStockerFetch({this.data});
  @override
  List<Object> get props => [data];
}
