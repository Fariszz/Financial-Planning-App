class RichesUtangModel {
  int? id;
  String? utang;
  int? rupiah;

  RichesUtangModel({
    this.id,
    this.utang,
    this.rupiah,
  });

  RichesUtangModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    utang = json['utang'];
    rupiah = json['rupiah'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'utang': utang,
      'rupiah': rupiah,
    };
  }
}
