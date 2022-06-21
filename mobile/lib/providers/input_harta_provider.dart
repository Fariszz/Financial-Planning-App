import 'package:flutter/cupertino.dart';

import '../Service/input_service.dart';
import '../models/RichesHarta_model.dart';

class InputHartaProvider with ChangeNotifier {
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

      _inputHarta = inputHarta;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}