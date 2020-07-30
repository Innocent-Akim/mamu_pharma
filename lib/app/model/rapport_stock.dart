class ModelRapport {
  String id;
  String designation;
  String categorie;
  String qteEntre;
  String paEntrer;
  String ptEntre;
  String qteSortie;
  String puSortie;
  String ptSortie;
  String qteStock;
  String puStock;
  String valStock;
  String date;
  String entreprise;
  String ref;
  ModelRapport({
    this.id,
    this.designation,
    this.categorie,
    this.qteEntre,
    this.paEntrer,
    this.ptEntre,
    this.qteSortie,
    this.puSortie,
    this.ptSortie,
    this.qteStock,
    this.puStock,
    this.valStock,
    this.date,
    this.entreprise,
    this.ref,
  });

  factory ModelRapport.fromJson(Map<String, dynamic> json) => _$fromJson(json);
  Map<String, dynamic> toJson() => _$toJson(this);
}

ModelRapport _$fromJson(Map<String, dynamic> json) {
  return ModelRapport(
      id: json['id'].toString(),
      designation: json['designation_pro'].toString(),
      categorie: json['categorie'].toString(),
      qteEntre: json['Qte_Entre'].toString(),
      paEntrer: json['PA_Entre'].toString(),
      ptEntre: json['Ptotal_Entre'].toString(),
      qteSortie: json['Qte_Sortie'].toString(),
      puSortie: json['Pun_Sortie'].toString(),
      ptSortie: json['Ptotal_Sortie'].toString(),
      qteStock: json['Qte_Stock'].toString(),
      puStock: json['PUnitaireStock'].toString(),
      valStock: json['ValStock'].toString(),
      date: json['Date'].toString(),
      entreprise: json['idEntreprise'].toString(),
      ref: json['ref'].toString());
}

Map<String, dynamic> _$toJson(ModelRapport rapport) => <String, dynamic>{
      'id': rapport.id,
      'designation_pro': rapport.designation,
      'categorie': rapport.categorie,
      'Qte_Entre': rapport.qteEntre,
      'PA_Entre': rapport.paEntrer,
      'Ptotal_Entre': rapport.ptEntre,
      'Qte_Sortie': rapport.qteSortie,
      'Pun_Sortie': rapport.puSortie,
      'Ptotal_Sortie': rapport.ptSortie,
      'Qte_Stock': rapport.qteStock,
      'PUnitaireStock': rapport.puStock,
      'ValStock': rapport.valStock,
      'Date': rapport.date,
      'idEntreprise': rapport.entreprise,
      'ref': rapport.ref
    };
