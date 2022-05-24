class UserModel {
  int? id;
  String? email;
  String? password;
  String? username;
  String? token;

  UserModel({
    this.id,
    this.email,
    this.password,
    this.username,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    username = json['username'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'passowrd': password,
      'username': username,
      'token': token,
    };
  }
}
