import 'dart:convert';
// import 'package:donor_darah/main.dart';
// import 'package:admin_donor_darah/models/login.dart';
// import 'package:admin_donor_darah/ui/pages/welcome_page.dart';
// import 'package:donor_darah/ui/pages/main_page.dart';
import 'package:admin_donor_darah/model/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  bool _isAuthenticated = false;

  bool get isAuthenticated => _isAuthenticated;

  set isAuthenticated(bool isAuth) {
    _isAuthenticated = isAuth;
    notifyListeners();
  }

  String baseUrl = 'http://34.227.139.129/api/auth';
  BuildContext? context;

  register(
    String id,
    String name,
    String email,
    String password,
    String alamat,
    Enum jenis_kelamin,
    Enum goldarah,
    Enum roles,
    String profil_pictures,
  ) async {
    var url = Uri.parse('$baseUrl/register');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'id': id,
      'name': name,
      'email': email,
      'alamat': alamat,
      'password': password,
      'jenis_kelamin': jenis_kelamin,
      'goldarah': goldarah,
      'roles': roles,
      'profil_pictures': profil_pictures,
    });

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['user'];
      print(data);

      User user = User.fromJson(data['user']);
      // user.access_token = 'Bearer ' + data['access_token'];

      print('Berhasil');
    } else {
      print('Gagal');
    }
  }

  Future<User> login({
    String? email,
    String? password,
  }) async {
    await Future.delayed(Duration(seconds: 5));
    var url = Uri.parse('$baseUrl/login');
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
    print(response.statusCode);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data['access_token']);
      print(data['email']);

      User user = User(access_token: 'Bearer ' + data['access_token']);

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }

  Future getUser(String id) async {
    String url = baseUrl + 'user';

    var response = await http.post(Uri.parse(url),
        headers: {'content-Type': "application/json"},
        body: jsonEncode(<String, String>{
          'id': id,
        }));

    if (response.statusCode != 200) {
      print('Gagal Login');
    } else {
      final data = jsonDecode(response.body)['user'];
      print(data);

      User user = User.fromJson(data['user']);
      // user.access_token = 'Bearer ' + data['access_token'];

      print('Berhasil');
    }
  }

  Future<User> logout({
    String? access_token,
  }) async {
    // await Future.delayed(Duration(seconds: 5));
    var url = Uri.parse('$baseUrl/logout');
    var body = jsonEncode({
      'access_token': access_token,
    });
    var response = await http.post(
      url,
      body: body,
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      User user = User();
      return user;
    } else {
      throw Exception('gagal');
    }
  }
}
