class ModelVente {
  String montant;
  String date;
  String apayer;
  String dette;
  String agence;

  ModelVente({this.montant, this.date, this.apayer, this.dette, this.agence});
  factory ModelVente.fromJson(Map<String, dynamic> json) =>
      _$ModelVenteFromJson(json);
  Map<String, dynamic> toJson() => _$ModelVenteToJson(this);
}

ModelVente _$ModelVenteFromJson(Map<String, dynamic> json) {
  return ModelVente(
    montant: json['a_payer'].toString(),
    apayer: json['payer'].toString(),
    dette: json['dette'].toString(),
    date: json['dateAchat'].toString(),
    agence: json['idEntreprise'].toString(),
  );
}

Map<String, dynamic> _$ModelVenteToJson(ModelVente vente) => <String, dynamic>{
      'a_payer': vente.montant,
      'payer': vente.apayer,
      'dette': vente.dette,
      'dateAchat': vente.date,
      'idEntreprise': vente.agence,
    };
