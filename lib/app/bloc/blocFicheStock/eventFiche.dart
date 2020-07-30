import 'package:equatable/equatable.dart';

abstract class EventFiche extends Equatable {}

class EventFicheFetch extends EventFiche {
  final date;
  final entreprise;
  EventFicheFetch({this.date, this.entreprise});
  @override
  List<Object> get props => [];
}

class EventFicheonChanged extends EventFiche {
  final valeur;
  final entreprise;
  final date;
  EventFicheonChanged({this.valeur, this.entreprise, this.date});
  List<Object> get props => [valeur, entreprise, date];
}
