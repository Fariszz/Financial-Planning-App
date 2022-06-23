import 'dart:convert';

import 'package:mobile/models/RichesModel.dart';
import 'package:http/http.dart' as http;

class TotalPendapatanService {
  final String baseUrl = 'http://10.0.2.2:8000/api/v1';

  Future<List<RichesModel>> getTotals(String token) async {
    var url = '$baseUrl/total';

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
      List<RichesModel> totals = [];

      for (var item in data) {
        totals.add(RichesModel.fromJson(item));
      }

      return totals;
    } else {
      throw Exception('Failed  to get data totals');
    }
  }
}
