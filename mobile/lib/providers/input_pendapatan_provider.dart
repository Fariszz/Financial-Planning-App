import 'package:flutter/cupertino.dart';

import '../Service/input_service.dart';
import '../models/RichesPendapatan_mode.dart';

class InputPendapatanProvider with ChangeNotifier{
  // Input Pendapatan
  RichesPendapatanModel get inputPendapatan => _inputPendapatan;
  late RichesPendapatanModel _inputPendapatan;

  Future<bool> InputPendapatan({
    required String token,
    required String penghasilan,
    required int rupiah,
  }) async {
    try {
      RichesPendapatanModel? inputPendapatan = (await InputService().InputPendapatan(
        token = token,
        penghasilan = penghasilan,
        rupiah = rupiah,
      ));

      _inputPendapatan = inputPendapatan;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}