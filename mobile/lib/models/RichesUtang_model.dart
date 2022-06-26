class RichesUtangModel {
  late int id;
  late String utang;
  late int rupiah;

  RichesUtangModel({
    required this.id,
    required this.utang,
    required this.rupiah,
  });

  RichesUtangModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    utang = json['utang'];
    rupiah = json['rupiah'] as int;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'utang': utang,
      'rupiah': rupiah,
    };
  }
}
