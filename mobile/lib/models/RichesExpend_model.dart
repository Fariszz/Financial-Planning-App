class RichesExpendModel {
  late int rupiah;
  late String pengeluaran;

  RichesExpendModel({
    required this.rupiah,
    required this.pengeluaran,
  });

  RichesExpendModel.fromJson(Map<String, dynamic> json) {
    rupiah = json['rupiah'];
    pengeluaran = json['pengeluaran'];
  }

  Map<String, dynamic> toJson() {
    return {
      'rupiah': rupiah,
      'pengeluaran': pengeluaran,
    };
  }
}
