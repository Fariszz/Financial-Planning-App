class UserModel {
  late int id;
  late String name;
  late String email;
  late String password;
  late String passwordConfirmation;
  late String token;

  UserModel({
    id,
    required this.name,
    required this.email,
    required this.password,
    passwordConfirmation,
    token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'].toString();
    email = json['email'].toString();
    password = json['password'].toString();
    passwordConfirmation = json['password_confirmation'].toString();
    token = json['token'].toString();
  }

 

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'token': token,
    };
  }

  // Get username to Profile
   get _name => name;
   get _email => email;
}
