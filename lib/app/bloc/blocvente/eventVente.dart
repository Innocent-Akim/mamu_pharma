import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class EventVente extends Equatable {}

class EventVenteLoading extends EventVente {
  @override
  List<Object> get props => [];
}

class EventVenteLoaded extends EventVente {
  final entreprise;
  final limit;
  final limitdb;
  EventVenteLoaded(
      {@required this.entreprise, @required this.limit, this.limitdb});
  @override
  List<Object> get props => [];
}

class EventVentLoadede extends EventVente {
  final entreprise;
  final limit;
  final limitdb;
  EventVentLoadede(
      {@required this.entreprise, @required this.limit, this.limitdb});
  @override
  List<Object> get props => [entreprise, limit, limitdb];
}
