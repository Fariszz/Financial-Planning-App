import 'dart:convert';
import 'package:mobile/models/RichesHarta_model.dart';
import 'package:mobile/models/RichesUtang_model.dart';
import 'package:mobile/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/models/userlogin_model.dart';

// Input Hutang

class InputService {
  final String baseUrl = 'http://10.0.2.2:8000/api/v1';

  // Input Hutang
  Future<RichesUtangModel> InputHutang(
    String token,
    String utang,
    int rupiah,
  ) async {
    var url = '$baseUrl/hutang';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Authorization': token,
    };

    print(token);

    var body = jsonEncode({
      'utang': utang,
      'rupiah': rupiah,
    });
    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      // RichesUtangModel utang = RichesUtangModel.fromJson(data['utang']);
       RichesUtangModel utang = RichesUtangModel.fromJson(json.decode(data['utang']));

      return utang;
    } else {
      throw Exception('Failed to add data utang :)');
    }
  }

   // Input Harta
  Future<RichesHartaModel> InputHarta(
    String token,
    String harta,
    int rupiah,
  ) async {
    var url = '$baseUrl/harta';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Authorization': token,
    };

    print(token);

    var body = jsonEncode({
      'harta': harta,
      'rupiah': rupiah,
    });
    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      // RichesUtangModel utang = RichesUtangModel.fromJson(data['harta']);
       RichesHartaModel utang = RichesHartaModel.fromJson(json.decode(data['harta']));

      return utang;
    } else {
      throw Exception('Failed to add data Harta :)');
    }
  }
}
