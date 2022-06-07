import 'package:flutter/cupertino.dart';
import 'package:mobile/Service/auth_service.dart';
import 'package:mobile/models/user_model.dart';
import 'package:mobile/models/userlogin_model.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;
  late UserLoginModel _userLogin;

  UserModel get user => _user;
  UserLoginModel get userLogin => _userLogin;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    required String name,
    required String email,
    required String password,
    required String password_confirmation,
  }) async {
    try {
      UserModel? user = await AuthService().register(
        email = email,
        name = name,
        password = password,
        password_confirmation = password_confirmation,
      );

      _user = user!;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Provider Login

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      UserLoginModel? userLogin = (await AuthService().login(
        email = email,
        password = password,
      )) as UserLoginModel?;

      _userLogin = userLogin!;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
