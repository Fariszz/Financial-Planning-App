class RichesIdealBudgetModel {
  late int total_penghasilan;
  int? agama;
  int? tabungan;
  int? asuransi;
  int? cicilan;
  int? investasi;
  int? rumahTangga;
  int? anak;
  int? hiburan;

  RichesIdealBudgetModel({
    required this.total_penghasilan,
    agama,
    tabungan,
    asuransi,
    cicilan,
    investasi,
    rumahTangga,
    anak,
    hiburan,
  });

  RichesIdealBudgetModel.fromJson(Map<String, dynamic> json) {
    total_penghasilan = json['total_penghasilan'];
    agama = json['agama'];
    tabungan = json['tabungan'];
    asuransi = json['asuransi'];
    cicilan = json['cicilan'];
    investasi = json['investasi'];
    rumahTangga = json['rumah_tangga'];
    anak = json['anak'];
    hiburan = json['hiburan'];
  }

  Map<String, dynamic> toJson() {
    return {
      'total_penghasilan': total_penghasilan,      
      'agama': agama,
      'tabungan': tabungan,
      'asuransi': asuransi,
      'cicilan': cicilan,
      'investasi': investasi,
      'rumah_tangga': rumahTangga,
      'anak': anak,
      'hiburan': hiburan,      
    };
  }
}
