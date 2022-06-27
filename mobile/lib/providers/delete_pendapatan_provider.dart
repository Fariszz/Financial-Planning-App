import 'package:flutter/foundation.dart';

import 'package:mobile/Service/delete_hutang_service.dart';
import 'package:mobile/Service/delete_pendapatan_service.dart';

class DeletePendapatanProvider with ChangeNotifier {
  
  Future<bool> deletePendapatan(int id, String token) async {
    try {
      await DeletePendapatanService().deleteData(id, token);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
