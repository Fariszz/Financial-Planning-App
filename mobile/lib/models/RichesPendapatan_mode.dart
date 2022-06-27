class RichesPendapatanModel {
   int? id;
  late int rupiah;
  late String penghasilan;

  RichesPendapatanModel({
    required this.id,
    required this.rupiah,
    required this.penghasilan,
  });

  RichesPendapatanModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    rupiah = json['rupiah'] as int;
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
