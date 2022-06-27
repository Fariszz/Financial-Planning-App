import 'package:flutter/foundation.dart';

import 'package:mobile/Service/delete_hutang_service.dart';
import 'package:mobile/Service/delete_pendapatan_service.dart';
import 'package:mobile/Service/delete_pengeluaran_service.dart';

class DeletePengeluaranProvider with ChangeNotifier {
  Future<bool> deletePengeluaran(int id, String token) async {
    try {
      await DeletePengeluaranService().deleteData(id, token);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
