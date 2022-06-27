import 'package:flutter/cupertino.dart';
import 'package:mobile/models/RichesExpend_model.dart';

import '../Service/pengeluaran_service.dart';

class PengeluaranProvider with ChangeNotifier {
  List<RichesExpendModel> _pengeluarans = [];

  List<RichesExpendModel> get pengeluarans => _pengeluarans;

  set pengeluarans(List<RichesExpendModel> pengeluarans) {
    _pengeluarans = pengeluarans;
    notifyListeners();
  }

  Future<void> getPengeluarans(String token) async {
    try {
      List<RichesExpendModel> pengeluarans =
          await PengeluaranService().getPengeluarans(token);
      _pengeluarans = pengeluarans;
    } catch (e) {
      print(e);
    }
  }

  removePengeluaran(int id) {
    _pengeluarans.removeWhere((element) => element.id == id);
    // _pengeluarans.removeAt(id);
    notifyListeners();
  }
}
