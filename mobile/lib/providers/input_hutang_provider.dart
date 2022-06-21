import 'package:flutter/cupertino.dart';

import '../Service/input_service.dart';
import '../models/RichesUtang_model.dart';

class InputHutangProvider with ChangeNotifier {
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
}
