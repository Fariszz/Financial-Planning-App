import 'dart:convert';
import 'package:mobile/models/RichesExpend_model.dart';
import 'package:mobile/models/RichesHarta_model.dart';
import 'package:mobile/models/RichesIdeal_model.dart';
import 'package:mobile/models/RichesPendapatan_mode.dart';
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
      RichesUtangModel utang =
          RichesUtangModel.fromJson(json.decode(data['utang']));

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
      // RichesUtangModel utang = RichesUtangModel.fromJson(data['utang']);
      RichesHartaModel utang =
          RichesHartaModel.fromJson(json.decode(data['harta']));

      return utang;
    } else {
      throw Exception('Failed to add data Harta :)');
    }
  }

  // Input Pendapatan
  Future<RichesPendapatanModel> InputPendapatan(
    String token,
    String penghasilan,
    int rupiah,
  ) async {
    var url = '$baseUrl/income';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Authorization': token,
    };

    print(token);

    var body = jsonEncode({
      'penghasilan': penghasilan,
      'rupiah': rupiah,
    });
    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      // RichesUtangModel penghasilan = RichesUtangModel.fromJson(data['penghasilan']);
      RichesPendapatanModel penghasilan =
          RichesPendapatanModel.fromJson(json.decode(data['penghasilan']));

      return penghasilan;
    } else {
      throw Exception('Failed to add data Penghasilan :)');
    }
  }

  // Input Pengeluaran
  Future<RichesExpendModel> InputPengeluaran(
    String token,
    String pengeluaran,
    int rupiah,
  ) async {
    var url = '$baseUrl/expenditure';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Authorization': token,
    };

    print(token);

    var body = jsonEncode({
      'pengeluaran': pengeluaran,
      'rupiah': rupiah,
    });
    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      // RichesUtangModel pengeluaran = RichesUtangModel.fromJson(data['pengeluaran']);
      RichesExpendModel pengeluaran =
          RichesExpendModel.fromJson(json.decode(data['pengeluaran']));

      return pengeluaran;
    } else {
      throw Exception('Failed to add data pengeluaran :)');
    }
  }

  // Input IdealBudget
  Future<RichesIdealBudgetModel> InputIdealBudget(
    String token,
    int total_penghasilan,
  ) async {
    var url = '$baseUrl/ideal-budget';
    var headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Authorization': token,
    };

    print(token);

    var body = jsonEncode({
      'total_penghasilan': total_penghasilan,
    });
    var response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      RichesIdealBudgetModel total_penghasilan =
          RichesIdealBudgetModel.fromJson(data['data']);
      return total_penghasilan;
    } else {
      throw Exception('Failed to add data ideal-budget :)');
    }
  }
}
