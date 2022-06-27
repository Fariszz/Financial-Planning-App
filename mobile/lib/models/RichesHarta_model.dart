import 'package:mobile/models/user_model.dart';

class RichesHartaModel {
  int? rupiah;
  int? id;
  String? harta;

  RichesHartaModel({
    this.id,
    this.rupiah,
    this.harta,
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
