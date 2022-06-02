class RichesHartaModel {
  late int id;
  late int rupiah;
  late String harta;

  RichesHartaModel({
    required this.id,
    required this.rupiah,
    required this.harta,
  
  });

  RichesHartaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rupiah = json['rupiah'];
    harta = json['harta'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'rupiah': rupiah,
      'harta': harta,
    };
  }
}

 