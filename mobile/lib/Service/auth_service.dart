import 'dart:convert';
import 'package:mobile/models/RichesUtang_model.dart';
import 'package:mobile/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/models/userlogin_model.dart';

class AuthService {
  final String baseUrl = 'http://10.0.2.2:8000/api/v1';

  Future<UserModel?> register(
    String name,
    String email,
    String password,
    String passwordConfirmation,
  ) async {
    var url = '$baseUrl/register';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*'
    };
    var body = jsonEncode({
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
    });
    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);
    print(body);
    print(response.body);
    // print(jsonDecode(response.body));

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

  Future<UserModel?> login(
    String? email,
    String? password,
  ) async {
    var url = '$baseUrl/login';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*'
    };
    var body = jsonEncode({
      'email': email,
      'password': password,
    });
    print(body);
    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Failed to Login :)');
    }
  }

  //Logout Service
  Future<void> logout(String token) async {
    var url = '$baseUrl/logout';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Authorization': token
    };
    var response = await http.post(Uri.parse(url), headers: headers);
    print(response.body);
  }
}
