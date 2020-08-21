class ModelStock {
  String quantite;
  String entreprise;
  ModelStock({this.quantite, this.entreprise});

  factory ModelStock.fromJson(Map<String, dynamic> json) => _$FromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);
}

ModelStock _$FromJson(Map<String, dynamic> json) {
  return ModelStock(
      quantite: json['quantite'].toString(),
      entreprise: json['idEntreprise'].toString());
}

Map<String, dynamic> _$toJson(ModelStock stock) => <String, dynamic>{
      'quantite': stock.quantite,
      'idEntreprise': stock.entreprise
    };
