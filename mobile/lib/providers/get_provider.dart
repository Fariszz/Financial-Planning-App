import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:mobile/Page/input_pendapatan.dart';
import 'package:mobile/Service/get_service.dart';
import 'package:mobile/Service/input_service.dart';
import 'package:mobile/models/RichesExpend_model.dart';
import 'package:mobile/models/RichesHarta_model.dart';
import 'package:mobile/models/RichesIdeal_model.dart';
import 'package:mobile/models/RichesPendapatan_mode.dart';
import 'package:mobile/models/RichesUtang_model.dart';

class GetProvider with ChangeNotifier {
  List<RichesHartaModel> _getHarta = [];

  List<RichesHartaModel> get getHarta => _getHarta;

  set getHarta(List<RichesHartaModel> getHarta) {
    _getHarta = getHarta;
    notifyListeners();
  }

  Future<void> harta() async {
    try {
      List<RichesHartaModel> getHarta =
          (await GetService().GetHarta) as List<RichesHartaModel>;
      _getHarta = getHarta;
    } catch (e) {
      print(e);
    }
  }
}
