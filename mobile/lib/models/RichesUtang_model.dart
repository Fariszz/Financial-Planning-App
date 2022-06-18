class RichesUtangModel {  
  late String utang;
  late int rupiah;

  RichesUtangModel({    
    required this.utang,
    required this.rupiah,
  });

  RichesUtangModel.fromJson(Map<String, dynamic> json) {    
    utang = json['utang'];
    rupiah = json['rupiah'] as int;
  }

  Map<String, dynamic> toJson() {
    return {      
      'utang': utang,
      'rupiah': rupiah,
    };
  }
}
