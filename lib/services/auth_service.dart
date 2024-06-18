import 'dart:convert';

import 'package:erisrental/config.dart';
import 'package:erisrental/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<UserModel> register({
    String? email,
    String? nama,
    String? password,
    String? identitas,
    String? umur,
    String? noHp,
    String? alamat,
    String? jaminan,
  }) async {
    // var url = '$baseUrl/register';
    var url = Uri.parse('${AppConfig.baseUrl}/signup');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'nama': nama,
      'password': password,
      'identitas': identitas,
      'umur': umur,
      'no_hp': noHp,
      'alamat': alamat,
      'jaminan': jaminan,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login({
    String? email,
    String? password,
  }) async {
    var url = Uri.parse('${AppConfig.baseUrl}/signin');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }

  Future<void> logout(String token) async {
    var url = Uri.parse('${AppConfig.baseUrl}/signout');
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };

    var response = await http.post(
      url,
      headers: headers,
    );

    print(response.body);

    if (response.statusCode == 200) {
      print('Logout berhasil');
    } else {
      throw Exception('Gagal Logout');
    }
  }
}
