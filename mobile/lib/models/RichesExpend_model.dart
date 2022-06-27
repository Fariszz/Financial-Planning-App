class RichesExpendModel {
  late int id = 0;
  late int rupiah;
  late String pengeluaran;

  RichesExpendModel({
    required this.id,
    required this.rupiah,
    required this.pengeluaran,
  });

  RichesExpendModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    rupiah = json['rupiah'] as int;
    pengeluaran = json['pengeluaran'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rupiah': rupiah,
      'pengeluaran': pengeluaran,
    };
  }
}
