import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mobile/models/RichesUtang_model.dart';

class DeleteHutangService {
  final String baseUrl = 'http://10.0.2.2:8000/api/v1';

  // Future<RichesUtangModel> fetchData() async {
  //   var url = '$baseUrl/harta';
  //   final response = await http.get(
  //     Uri.parse(url),
  //   );

  //   if (response.statusCode == 200) {
  //     return RichesUtangModel.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to load Data');
  //   }
  // }

  Future<RichesUtangModel> deleteData(int id, String token) async {
    var url = '$baseUrl/hutang/$id';
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
      return RichesUtangModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to delete Data.');
    }
  }
}
