import 'dart:convert';

import 'package:mobile/models/RichesHarta_model.dart';

import 'package:http/http.dart' as http;

class DeleteHartaService {
  final String baseUrl = 'http://10.0.2.2:8000/api/v1';

  // Future<RichesHartaModel> fetchData() async {
  //   var url = '$baseUrl/harta';
  //   final response = await http.get(
  //     Uri.parse(url),
  //   );

  //   if (response.statusCode == 200) {
  //     return RichesHartaModel.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to load Data');
  //   }
  // }

  Future<RichesHartaModel> deleteData(int id, String token) async {
    var url = '$baseUrl/harta/$id';
    final http.Response response = await http.delete(
      Uri.parse('$url'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Authorization': token,
      },
    );
    print("ini dari service");
    print(response.statusCode);
    if (response.statusCode == 200) {
      return RichesHartaModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete Data.');
    }
  }
}
