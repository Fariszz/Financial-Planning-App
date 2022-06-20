import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/models/RichesUtang_model.dart';


class HutangService {
  final String baseUrl = 'http://10.0.2.2:8000/api/v1';

  Future<List<RichesUtangModel>> getHutangs(String token) async {
    var url = '$baseUrl/hutang';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Authorization': token,
    };

    var response = await http.get(Uri.parse(url), headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];
      List<RichesUtangModel> hutangs = [];

      for (var item in data) {
        hutangs.add(RichesUtangModel.fromJson(item));
      }

      return hutangs;
    } else {
      throw Exception('Failed to get data hutang :)');
    }
  }
}