class ModelStock {
  String quantite;
  String entreprise;
  ModelStock({this.quantite, this.entreprise});

  factory ModelStock.fromJson(Map<String, dynamic> json) => _$FromJson(json);
  Map<String, dynamic> toJson() => _$ToJson(this);
}

ModelStock _$FromJson(Map<String, dynamic> json) {
  return ModelStock(
      quantite: json['quantite'].toString(),
      entreprise: json['idEntreprise'].toString());
}

Map<String, dynamic> _$ToJson(ModelStock stock) => <String, dynamic>{
      'quantite': stock.quantite,
      'idEntreprise': stock.entreprise
    };
