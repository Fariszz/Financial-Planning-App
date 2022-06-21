import 'package:flutter/cupertino.dart';

import '../Service/input_service.dart';
import '../models/RichesExpend_model.dart';

class InputExpendProvider with ChangeNotifier{
  // Input Harta
  RichesExpendModel get inputPengeluaran => _inputPengeluaran;
  late RichesExpendModel _inputPengeluaran;

  Future<bool> InputExpend({
    required String token,
    required String pengeluaran,
    required int rupiah,
  }) async {
    try {
      RichesExpendModel? inputPengeluaran = (await InputService().InputPengeluaran(
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
}