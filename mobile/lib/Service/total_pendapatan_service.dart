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
      List data = jsonDecode(response.body)['data'];
      
      List<RichesModel> totals = [];
      
      // print(data[0]['total_harta']);
      // print(data[0]['total_utang'])
      for (var item in data) {
        totals.add(RichesModel.fromJson(item));
      }

      return totals;
    } else {
      throw Exception('Failed  to get data totals');
    }
  }

  // Future<RichesModel> getTotal(String token) async {
  //   var url = '$baseUrl/total';

  //   var headers = {
  //     'Content-Type': 'application/json',
  //     'Accept': 'application/json',
  //     'Access-Control-Allow-Origin': '*',
  //     'Authorization': token,
  //   };

  //   var response = await http.get(Uri.parse(url), headers: headers);

  //   print("ini adalah response dari body");
  //   print(response.body);

  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body)['data']['data'];

  //     RichesModel total = RichesModel.fromJson(data);
  //     return total;
  //   } else {
  //     throw Exception('Failed  to get data total');
  //   }
  // }
}
