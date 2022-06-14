class RichesUtangModel {
  late String utang;
  late int rupiah;

  RichesUtangModel({
    required this.utang,
    required this.rupiah,
  });

  RichesUtangModel.fromJson(Map<dynamic, dynamic> json) {
    utang = json['utang'];
    rupiah = json['rupiah'];
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'utang': utang,
      'rupiah': rupiah,
    };
  }
}
