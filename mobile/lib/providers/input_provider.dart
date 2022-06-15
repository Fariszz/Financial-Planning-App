import 'package:flutter/cupertino.dart';
import 'package:mobile/Page/input_pendapatan.dart';
import 'package:mobile/Service/input_service.dart';
import 'package:mobile/models/RichesExpend_model.dart';
import 'package:mobile/models/RichesHarta_model.dart';
import 'package:mobile/models/RichesIdeal_model.dart';
import 'package:mobile/models/RichesPendapatan_mode.dart';
import 'package:mobile/models/RichesUtang_model.dart';

// Input Hutang
class InputProvider with ChangeNotifier {
  // Input Hutang
  RichesUtangModel get inputHutang => _inputHutang;
  late RichesUtangModel _inputHutang;

  Future<bool> InputHutang({
    required String token,
    required String utang,
    required int rupiah,
  }) async {
    try {
      RichesUtangModel? inputHutang = (await InputService().InputHutang(
        token = token,
        utang = utang,
        rupiah = rupiah,
      ));

      _inputHutang = inputHutang;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Input Harta
  RichesHartaModel get inputHarta => _inputHarta;
  late RichesHartaModel _inputHarta;

  Future<bool> InputHarta({
    required String token,
    required String harta,
    required int rupiah,
  }) async {
    try {
      RichesHartaModel? inputHarta = (await InputService().InputHarta(
        token = token,
        harta = harta,
        rupiah = rupiah,
      ));

      _inputHutang = inputHutang;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Input Pendapatan
  RichesPendapatanModel get inputPendapatan => _inputPendapatan;
  late RichesPendapatanModel _inputPendapatan;

  Future<bool> InputPendapatan({
    required String token,
    required String penhasilan,
    required int rupiah,
  }) async {
    try {
      RichesPendapatanModel? inputPendapatan =
          (await InputService().InputPendapatan(
        token = token,
        penhasilan = penhasilan,
        rupiah = rupiah,
      ));

      _inputPendapatan = inputPendapatan;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Input Pengeluaran
  RichesExpendModel get inputPengeluaran => _inputPengeluaran;
  late RichesExpendModel _inputPengeluaran;

  Future<bool> InputPengeluaran({
    required String token,
    required String pengeluaran,
    required int rupiah,
  }) async {
    try {
      RichesExpendModel? inputPengeluaran =
          (await InputService().InputPengeluaran(
        token = token,
        pengeluaran = pengeluaran,
        rupiah = rupiah,
      ));

      _inputPengeluaran = inputPengeluaran;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Input IdealBudget
  RichesIdealBudgetModel get inputIdealBudget => _inputIdealBudget;
  late RichesIdealBudgetModel _inputIdealBudget;

  Future<bool> InputIdealBudget({
    required String token,
    required int total_penghasilan,
  }) async {
    try {
      RichesIdealBudgetModel? inputIdealBudget =
          (await InputService().InputIdealBudget(
        token = token,
        total_penghasilan = total_penghasilan,
      ));

      _inputIdealBudget = inputIdealBudget;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
