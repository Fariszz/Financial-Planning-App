import 'package:mobile/models/RichesModel.dart';
import 'package:flutter/cupertino.dart';

import '../Service/total_pendapatan_service.dart';

class TotalPendapatanProvider with ChangeNotifier{
  
  List<RichesModel> _totalPendapatans = [];

  List<RichesModel> get totalPendapatans => _totalPendapatans;

  set totals(List<RichesModel> totalPendapatan) {
    _totalPendapatans = totalPendapatans;
    notifyListeners();
  }

  Future<void> getTotals(String token) async {
    try {
      List<RichesModel> totalPendapatans = await TotalPendapatanService().getTotals(token);
      _totalPendapatans = totalPendapatans;      
    } catch (e) {
      print(e);      
      
    }
  }
}