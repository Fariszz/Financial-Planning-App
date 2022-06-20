import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/models/RichesExpend_model.dart';

class PengeluaranService {
  final String baseUrl = 'http://10.0.0.2:8000/api/v1';

  Future<List<RichesExpendModel>> getPengeluarans(String token) async {
    var url = '$baseUrl/expenditure';

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
      List<RichesExpendModel> pengeluarans = [];

      for (var item in data) {
        pengeluarans.add(RichesExpendModel.fromJson(item));
      }

      return pengeluarans;
    } else {
      throw Exception('Failed to get data pengeluaran :)');
    }
  }
}
