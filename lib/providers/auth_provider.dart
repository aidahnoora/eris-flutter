import 'package:erisrental/models/user_model.dart';
import 'package:erisrental/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    String? email,
    String? nama,
    String? password,
    String? identitas,
    String? umur,
    String? noHp,
    String? alamat,
    String? jaminan,
  }) async {
    try {
      UserModel user = await AuthService().register(
        email: email,
        password: password,
        nama: nama,
        identitas: identitas,
        umur: umur,
        noHp: noHp,
        alamat: alamat,
        jaminan: jaminan,
      );

      _user = user;

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({
    String? email,
    String? password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      await AuthService().logout(_user.token!);
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
