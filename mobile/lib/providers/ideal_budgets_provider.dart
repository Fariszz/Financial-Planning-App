import 'package:flutter/cupertino.dart';

import '../Service/ideal_budget_service.dart';
import '../models/RichesIdeal_model.dart';

class IdealBudgetProvider with ChangeNotifier {
  List<RichesIdealBudgetModel> _idealBudgets = [];

  List<RichesIdealBudgetModel> get idealBudgets => _idealBudgets;

  set ideals(List<RichesIdealBudgetModel> idealBudgets) {
    _idealBudgets = idealBudgets;
    notifyListeners();
  }

  Future<void> getIdealBudgets(String token) async {
    try {
      List<RichesIdealBudgetModel> idealBudgets =
          await IdealBudgetService().getIdealBudgets(token);
      _idealBudgets = idealBudgets;
    } catch (e) {
      print(e);
    }
  }
}
