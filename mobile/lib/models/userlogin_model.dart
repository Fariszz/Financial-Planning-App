class UserLoginModel {
  late String email;
  late String password;

  UserLoginModel({
    required this.email,
    required this.password,
  });

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'].toString();
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'passowrd': password,
    };
  }
}
