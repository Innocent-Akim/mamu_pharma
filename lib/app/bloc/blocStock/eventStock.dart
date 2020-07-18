import 'package:equatable/equatable.dart';

abstract class EventStock extends Equatable {}

class EventStockfetch extends EventStock {
  @override
  List<Object> get props => [];
}

class EventStockerFetch extends EventStock {
  final entreprise;
  EventStockerFetch({this.entreprise});
  @override
  List<Object> get props => [];
}
