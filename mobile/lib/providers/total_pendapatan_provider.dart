import 'package:mobile/models/RichesModel.dart';
import 'package:flutter/cupertino.dart';

import '../Service/total_pendapatan_service.dart';

class TotalPendapatanProvider with ChangeNotifier {
  List<RichesModel> _totalPendapatans = [];
  // late RichesModel _totalPendapatan;

  // RichesModel get totalPendapatan => _totalPendapatan;

  List<RichesModel> get totalPendapatans => _totalPendapatans;

  set totalPendapatans(List<RichesModel> totalPendapatans) {
    _totalPendapatans = totalPendapatans;
    notifyListeners();
  }

  // set totalPendapatan(RichesModel totalPendapatan) {
  //   _totalPendapatan = totalPendapatan;
  //   notifyListeners();
  // }

  Future<void> getTotals(String token) async {
    try {
      List<RichesModel>? totalPendapatans =
          (await TotalPendapatanService().getTotals(token));
      _totalPendapatans = totalPendapatans;      
    } catch (e) {
      print(e);      
    }
  }

  // Future bool get data
  // Future<bool> getTotal(String token) async {
  //   try {
  //     RichesModel totalPendapatan = await TotalPendapatanService().getTotal(token);
  //     _totalPendapatan = totalPendapatan;
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }

  // Future<void> getTotal(String token) async {
  //   try {
  //     RichesModel totalPendapatan =
  //         await TotalPendapatanService().getTotal(token);
  //     _totalPendapatan = totalPendapatan;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  // RichesModel riches = RichesModel();

  // getPostData(String token, context) async {
  //   riches = await TotalPendapatanService().getTotal(token, context);

  //   notifyListeners();
  // }

// getPostData(String token, context) async{
//   TotalPendapatanService().getTotal(token, context).then((value){
//     riches = value;
//     notifyListeners();
//   });
// }

}
