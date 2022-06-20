import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/RichesHarta_model.dart';

class HartaService {
  final String baseUrl = 'http://10.0.2.2:8000/api/v1';

  Future<List<RichesHartaModel>> getHartas(String token) async {
    var url = '$baseUrl/harta';
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
      List<RichesHartaModel> hartas = [];
      
      for (var item in data) {
        hartas.add(RichesHartaModel.fromJson(item));
      }
      
      return hartas;
    } else {
      throw Exception('Failed to get data harta :)');
    }
  }
}
