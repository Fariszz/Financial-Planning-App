import 'package:flutter/cupertino.dart';
import 'package:mobile/Service/harta_service.dart';
import 'package:mobile/models/RichesUtang_model.dart';

import '../Service/hutang_service.dart';

class HutangProvider with ChangeNotifier{
  List<RichesUtangModel> _hutangs = [];

  List<RichesUtangModel> get hutangs => _hutangs;

  set hutangs(List<RichesUtangModel> hutangs) {
    _hutangs = hutangs;
    notifyListeners();
  }

  Future<void> getHutangs(String token) async {
    try {
      List<RichesUtangModel> hutangs = await HutangService().getHutangs(token);
      _hutangs = hutangs;
    } catch (e) {
      print(e);
    }
  }
}