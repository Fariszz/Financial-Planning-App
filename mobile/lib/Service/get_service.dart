import 'dart:convert';
import 'package:mobile/models/RichesExpend_model.dart';
import 'package:mobile/models/RichesHarta_model.dart';
import 'package:mobile/models/RichesIdeal_model.dart';
import 'package:mobile/models/RichesPendapatan_mode.dart';
import 'package:mobile/models/RichesUtang_model.dart';
import 'package:mobile/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/models/userlogin_model.dart';

class GetService {
  final String baseUrl = 'http://10.0.2.2:8000/api/v1';

  Future<RichesUtangModel> GetHarta(
    String token,
    String harta,
    int rupiah,
  ) async {
    var url = '$baseUrl/hutang';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Authorization': token,
    };

    print(token);

    var body = jsonEncode({
      'harta': harta,
      'rupiah': rupiah,
    });
    var response =
        await http.get(Uri.parse(url), headers: headers,);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<RichesUtangModel> harta = [];

      for (var i in data) {
        RichesUtangModel _harta = RichesUtangModel.fromJson(i);
        harta.add(_harta);
      }

      return harta[0];
    } else {
      throw Exception('Failed to Get Harta :)');
    }
  }
}
