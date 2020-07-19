import 'package:equatable/equatable.dart';
import 'package:mamusoft/app/model/rapport_stock.dart';

abstract class StateFiche extends Equatable {}

class StateFicheInit extends StateFiche {
  @override
  List<Object> get props => [];
}

class StateFicheLoading extends StateFiche {
  @override
  List<Object> get props => [];
}

class SteteFicheLoaded extends StateFiche {
  final List<ModelRapport> fiche;
  SteteFicheLoaded({this.fiche});
  @override
  List<Object> get props => [];
}
