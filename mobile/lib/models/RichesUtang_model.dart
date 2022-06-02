class RichesUtangModel {
  late int id;
  late int rupiah;
  late String utang;

  RichesUtangModel({
    required this.id,
    required this.rupiah,
    required this.utang,
  });

  RichesUtangModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rupiah = json['rupiah'];
    utang = json['utang'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rupiah': rupiah,
      'utang': utang,
    };
  }
}
