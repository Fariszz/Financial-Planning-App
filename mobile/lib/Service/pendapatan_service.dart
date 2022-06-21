import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/models/RichesPendapatan_mode.dart';

class PendapatanService {
  final String baseUrl = 'http://10.0.0.2:8000/api/v1';

  Future<List<RichesPendapatanModel>> getPendapatans(String token) async {
    var url = '$baseUrl/income';

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
      List<RichesPendapatanModel> pendapatans = [];

      for (var item in data) {
        pendapatans.add(RichesPendapatanModel.fromJson(item));
      }

      return pendapatans;
    } else {
      throw Exception('Failed to get data pendapatan :)');
    }
  }
}
