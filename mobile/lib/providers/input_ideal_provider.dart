import 'package:flutter/cupertino.dart';

import '../Service/input_service.dart';
import '../models/RichesIdeal_model.dart';

class InputIdealProvider with ChangeNotifier{
  // Input Ideal
  RichesIdealBudgetModel get inputIdealBudget => _inputIdealBudget;
  late RichesIdealBudgetModel _inputIdealBudget;

  Future<bool> InputIdeal({
    required String token,
    required int total_penghasilan,    
  }) async {
    try {
      RichesIdealBudgetModel? inputIdealBudget = (await InputService().InputIdealBudget(
        token = token,
        total_penghasilan = total_penghasilan
      ));

      _inputIdealBudget = inputIdealBudget;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}