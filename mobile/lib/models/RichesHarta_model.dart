import 'package:mobile/models/user_model.dart';

class RichesHartaModel {
  late int rupiah;
  late String harta;
  late UserModel user;

  RichesHartaModel({
    required this.rupiah,
    required this.harta,
    required this.user
  });

  RichesHartaModel.fromJson(Map<String, dynamic> json) {
    rupiah = json['rupiah'];
    harta = json['harta'];
    user = UserModel.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    return {
      'rupiah': rupiah,
      'harta': harta,
      'user': user.toJson()
    };
  }
}
