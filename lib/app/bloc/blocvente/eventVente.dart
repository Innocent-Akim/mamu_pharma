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
  EventVenteLoaded({@required this.entreprise, @required this.limit});
  @override
  List<Object> get props => [];
}
