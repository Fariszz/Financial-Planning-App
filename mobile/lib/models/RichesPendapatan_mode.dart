class RichesPendapatanModel {
  late int rupiah;
  late String penghasilan;

  RichesPendapatanModel({
    required this.rupiah,
    required this.penghasilan,
  });

  RichesPendapatanModel.fromJson(Map<String, dynamic> json) {
    rupiah = json['rupiah'] as int;
    penghasilan = json['penghasilan'];
  }

  Map<String, dynamic> toJson() {
    return {
      'rupiah': rupiah,
      'penghasilan': penghasilan,
    };
  }
}
