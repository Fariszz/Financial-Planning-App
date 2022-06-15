
class RichesIdealBudgetModel {
  late int total_penghasilan;


  RichesIdealBudgetModel({
    required this.total_penghasilan,
   
  });

  RichesIdealBudgetModel.fromJson(Map<String, dynamic> json) {
    total_penghasilan = json['total_penghasilan'];
  
  }

  Map<String, dynamic> toJson() {
    return {
      'total_penghasilan': total_penghasilan,
     
    };
  }
}
