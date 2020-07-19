import 'package:equatable/equatable.dart';

abstract class EventFiche extends Equatable {}

class EventFicheFetch extends EventFiche {
  final date;
  final entreprise;
  EventFicheFetch({this.date, this.entreprise});
  @override
  List<Object> get props => [];
}
