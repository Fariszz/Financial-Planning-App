import 'package:mobile/models/user_model.dart';

class RichesHartaModel {
  late int rupiah;
  late int id;
  late String harta;

  RichesHartaModel({
    required this.id,
    required this.rupiah,
    required this.harta,
  });

  RichesHartaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rupiah = json['rupiah'] as int;
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
