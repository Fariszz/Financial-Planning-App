class RichesModel {
  int? totalHarta;
  int? totalUtang;
  int? totalKekayaanBersih;
  int? sisaPenghasilan;
  String? status;

  RichesModel(
      {totalHarta, totalUtang, totalKekayaanBersih, sisaPenghasilan, status});

  RichesModel.fromJson(Map<String, dynamic> json) {
    totalHarta = json['total_harta'] as int;
    totalUtang = json['total_utang'] as int;
    totalKekayaanBersih = json['total_kekayaan_bersih'] as int;
    sisaPenghasilan = json['sisa_penghasilan'];
  }

  Map<String, dynamic> toJson() {
    return {
      'total_harta': totalHarta,
      'total_utang': totalUtang,
      'total_kekayaan_bersih': totalKekayaanBersih,
      'sisa_penghasilan': sisaPenghasilan,
      'status': status
    };
  }
}
