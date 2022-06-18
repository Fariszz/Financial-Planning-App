import 'dart:convert';

import 'package:mobile/models/RichesHarta_model.dart';

import 'package:http/http.dart' as http;

class GetService {
  final String baseUrl = 'http://10.0.2.2:8000/api/v1';

  Future<List<RichesHartaModel>> GetHarta() async {
    var url = '$baseUrl/harta';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*',
    };

    var response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];

      List<RichesHartaModel> harta = [];

      for (var i in data) {
        harta.add(RichesHartaModel.fromJson(i));
      }

      return harta;
    } else {
      throw Exception('Failed to Get Harta :)');
    }
  }
}
