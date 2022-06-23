import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/models/RichesIdeal_model.dart';

class IdealBudgetService {
  final String baseUrl = 'http://10.0.2.2:8000/api/v1';

  Future<List<RichesIdealBudgetModel>> getIdealBudgets(String token) async {
    var url = '$baseUrl/ideal-budget';

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
      List<RichesIdealBudgetModel> idealBudgets = [];

      for (var item in data) {
        idealBudgets.add(RichesIdealBudgetModel.fromJson(item));
      }

      return idealBudgets;
    } else {
      throw Exception('Failed to get data ideal budget :)');
    }
  }
}
