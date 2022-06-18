class RichesHartaModel {
  late int rupiah;
  late String harta;

  RichesHartaModel({
    required this.rupiah,
    required this.harta,
  });

  RichesHartaModel.fromJson(Map<String, dynamic> json) {
    rupiah = json['rupiah'] as int;
    harta = json['harta'];
  }

  Map<String, dynamic> toJson() {
    return {
      'rupiah': rupiah,
      'harta': harta,
    };
  }
}
