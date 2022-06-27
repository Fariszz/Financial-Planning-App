import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile/Service/harta_service.dart';

import '../models/RichesHarta_model.dart';

class HartaProvider with ChangeNotifier {
  List<RichesHartaModel> _hartas = [];

  List<RichesHartaModel> get hartas => _hartas;

  set hartas(List<RichesHartaModel> hartas) {
    _hartas = hartas;
    notifyListeners();
  }

  Future<void> getHartas(String token) async {
    try {
      List<RichesHartaModel> hartas = await HartaService().getHartas(token);
      _hartas = hartas;
    } catch (e) {
      print(e);
    }
  }

  removeHarta(int id) {
    _hartas.removeWhere((element) => element.id == id);
    // _hartas.removeAt(id);
    notifyListeners();
  }
}
