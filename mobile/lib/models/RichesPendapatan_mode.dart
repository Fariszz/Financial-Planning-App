class RichesPendapatanModel {
  int? id;
  int? rupiah;
  String? penghasilan;

  RichesPendapatanModel({
    this.id,
    this.rupiah,
    this.penghasilan,
  });

  RichesPendapatanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rupiah = json['rupiah'];
    penghasilan = json['penghasilan'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rupiah': rupiah,
      'penghasilan': penghasilan,
    };
  }
}
