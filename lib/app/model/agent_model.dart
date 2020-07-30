class ModelAgent {
  String nom, tel, mail, adress, entreprise;
  ModelAgent({this.nom, this.tel, this.mail, this.adress, this.entreprise});

  factory ModelAgent.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);
}

ModelAgent _$fromJson(Map<String, dynamic> json) {
  return ModelAgent(
      nom: json['nom'].toString(),
      tel: json['tel'].toString(),
      mail: json['mail'].toString(),
      adress: json['adress'].toString(),
      entreprise: json['entreprise'].toString());
}

Map<String, dynamic> _$toJson(ModelAgent agent) => <String, dynamic>{
      'nom': agent.nom,
      'tel': agent.tel,
      'mail': agent.mail,
      'adress': agent.adress,
      'entreprise': agent.entreprise
    };
