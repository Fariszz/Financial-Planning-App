import 'dart:convert';
import 'package:mobile/models/RichesUtang_model.dart';
import 'package:mobile/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/models/userlogin_model.dart';

class AuthService {
  final String baseUrl = 'http://10.0.2.2:8000/api/v1';

  Future<UserModel?> register(String? name, String? email, String? password,
      String? password_confirmation) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password_confirmation,
    });
    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Failed to register :)');
    }
  }

  //Login Service

  Future<UserLoginModel?> login(
    String? email,
    String? password,
  ) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });
    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserLoginModel user = UserLoginModel.fromJson(data['user']);

      return user;
    } else {
      throw Exception('Failed to Login :)');
    }
  }

  // Input Hutang

  Future<RichesUtangModel?> InputHutang(
    String? utang,
    int? rupiah,
  ) async {
    var url = '$baseUrl/utang';
    var headers = {'Content-Type': 'application/json'};

    var body = jsonEncode({
      'utang': utang,
      'rupiah': rupiah,
    });
    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      RichesUtangModel utang = RichesUtangModel.fromJson(data['riches_utang']);

      return utang;
    } else {
      throw Exception('Failed to add data utang :)');
    }
  }
}
