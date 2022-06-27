class RichesExpendModel {
 int? id;
 int? rupiah;
 String? pengeluaran;

  RichesExpendModel({
    this.id,
    this.rupiah,
    this.pengeluaran,
  });

  RichesExpendModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rupiah = json['rupiah'];
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
