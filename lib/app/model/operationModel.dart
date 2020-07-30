class ModelnbrOperation {
  String nobre;
  String date;
  ModelnbrOperation({this.date, this.nobre});

  factory ModelnbrOperation.fromJson(Map<String, dynamic> json) =>
      _$FromJson(json);
  Map<String, dynamic> toJson() => _$ToJson(this);
}

ModelnbrOperation _$FromJson(Map<String, dynamic> json) {
  return ModelnbrOperation(
      date: json['date'].toString(), nobre: json['id'].toString());
}

Map<String, dynamic> _$ToJson(ModelnbrOperation stock) =>
    <String, dynamic>{'date': stock.date, 'id': stock.nobre};

class ModelEntreprise {
  String id, designation, adresse, logo, rccn, idnat, idImpot, tel, mail;
  ModelEntreprise({
    this.id,
    this.designation,
    this.adresse,
    this.logo,
    this.rccn,
    this.idnat,
    this.idImpot,
    this.tel,
    this.mail,
  });
  factory ModelEntreprise.fromJson(Map<String, dynamic> json) =>
      _$jsonFrom(json);

  Map<String, dynamic> toJson() => _$jsonTo(this);
}

ModelEntreprise _$jsonFrom(Map<String, dynamic> json) {
  return ModelEntreprise(
      id: json['id'].toString(),
      designation: json['designation'].toString(),
      adresse: json['adresse'].toString(),
      logo: json['logon'].toString(),
      rccn: json['rccm'].toString(),
      idnat: json['idnat'].toString(),
      idImpot: json['idImpot'].toString(),
      tel: json['tel'].toString(),
      mail: json['email'].toString());
}

Map<String, dynamic> _$jsonTo(ModelEntreprise entreprise) => <String, dynamic>{
      'id': entreprise.id,
      'designation': entreprise.designation,
      'adresse': entreprise.adresse,
      'logon': entreprise.logo,
      'rccm': entreprise.rccn,
      'idnat': entreprise.idnat,
      'idImpot': entreprise.idImpot,
      'tel': entreprise.tel,
      'email': entreprise.mail
    };
