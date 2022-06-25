class RichesModel {
  int? totalHarta;
  int? totalUtang;
  int? totalKekayaanBersih;
  int? sisaPenghasilan;
  String? status;

  // late int totalHarta;
  // late int totalUtang;
  // late int totalKekayaanBersih;
  // late int sisaPenghasilan;
  // late String status;

  RichesModel(
      {this.totalHarta,
      this.totalUtang,
      this.totalKekayaanBersih,
      this.status,
      this.sisaPenghasilan});

  RichesModel.fromJson(Map<String, dynamic> json) {
    totalHarta = json['total_harta'];
    totalUtang = json['total_utang'];
    totalKekayaanBersih = json['total_kekayaan_bersih'];
    status = json['status'];
    sisaPenghasilan = json['sisa_penghasilan'];
  }

  Map<String, dynamic> toJson() {
    return {
      'total_harta': totalHarta,
      'total_utang': totalUtang,
      'total_kekayaan_bersih': totalKekayaanBersih,
      'status': status,
      'sisa_penghasilan': sisaPenghasilan
    };
  }

  get _totalHarta => totalHarta;
  get _totalUtang => totalUtang;
  get _totalKekayaanBersih => totalKekayaanBersih;
  get _sisaPenghasilan => sisaPenghasilan;
  get _status => status;
}
