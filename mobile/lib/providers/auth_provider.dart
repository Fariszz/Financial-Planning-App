import 'package:flutter/cupertino.dart';
import 'package:mobile/Page/InputHutang.dart';
import 'package:mobile/Service/auth_service.dart';
import 'package:mobile/models/RichesUtang_model.dart';
import 'package:mobile/models/user_model.dart';
import 'package:mobile/models/userlogin_model.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;
  late UserLoginModel _userLogin;
  late RichesUtangModel _inputHutang;

  UserModel get user => _user;
  UserLoginModel get userLogin => _userLogin;
  RichesUtangModel get inputHutang => _inputHutang;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      UserModel? user = (await AuthService().register(
        name = name,
        email = email,
        password = password,
        passwordConfirmation = passwordConfirmation,
      ));

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

  // Input Hutang

  Future<bool> InputHutang({
    required String utang,
    required int rupiah,
  }) async {
    try {
      RichesUtangModel? inputHutang = (await AuthService().InputHutang(
        utang = utang,
        rupiah = rupiah,
      )) as RichesUtangModel?;

      _inputHutang = inputHutang!;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
