import 'package:flutter/foundation.dart';

import 'package:mobile/Service/delete_hutang_service.dart';

class DeleteHutangProvider with ChangeNotifier {
  Future<bool> deleteHutang(int id, String token) async {
    try {
      await DeleteHutangService().deleteData(id, token);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
