import 'package:flutter/cupertino.dart';
import 'package:mobile/models/RichesPendapatan_mode.dart';

import '../Service/pendapatan_service.dart';

class PendapatanProvider with ChangeNotifier{
  List<RichesPendapatanModel> _pendapatans = [];

  List<RichesPendapatanModel> get pendapatans => _pendapatans;

  set pendapatans(List<RichesPendapatanModel> pendapatans) {
    _pendapatans = pendapatans;
    notifyListeners();
  }

  Future<void> getPendapatans(String token) async {
    try {
      List<RichesPendapatanModel> pendapatans = await PendapatanService().getPendapatans(token);
      _pendapatans = pendapatans;
    } catch (e) {
      print(e);    
    }
  }
}