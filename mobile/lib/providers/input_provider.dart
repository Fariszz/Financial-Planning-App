import 'package:flutter/cupertino.dart';
import 'package:mobile/Service/input_service.dart';
import 'package:mobile/models/RichesUtang_model.dart';


// Input Hutang
class InputProvider with ChangeNotifier {
  
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
