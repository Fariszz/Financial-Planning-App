import 'package:flutter/foundation.dart';
import 'package:mobile/Service/delete_harta_service.dart';

class DeleteHartaProvider with ChangeNotifier {
  Future<bool> deleteHarta(int? id, String token) async {
    try {
      await DeleteHartaService().deleteData(id!, token);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
