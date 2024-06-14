import 'dart:convert';

import 'package:flutter_embed_unity_android_example/app/constanta.dart';
import 'package:get_storage/get_storage.dart';

import '../data/models/class.dart' as schoolclass;
import '../data/models/school.dart' as school;
import '../data/models/user.dart';

class AuthService {
  String _message = "";

  String get message => _message;

  Future<bool> login({required String email, required String password}) async {
    try {
      final response = await dio.post('/login',
          data: jsonEncode({
            'email': email,
            'password': password,
          }));
      _message = response.data['messages'];
      if (response.statusCode == 200) {
        GetStorage().write('token', response.data['data']['accessToken']);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<User?> getUser() async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      var response = await dio.get('/user');
      print(response.data);
      if (response.statusCode == 200) {
        return User.fromJson(response.data['data']);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

/* 
    "namaLengkap" : "Pak wawan dayeuhkolot",
    "email" : "wawan@gmail.com",
    "password" : "password",
    "passwordConfirmation" : "password",
    "role" : "guru"

*/
  Future<List<school.School>> getAllSchool() async {
    try {
      String uri = '/school';

      var response = await dio.get(uri);
      if (response.statusCode == 200) {
        List? data = response.data['data'];
        if (data == null || data.isEmpty) {
          return [];
        } else {
          return data.map((e) => school.School.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<schoolclass.SchoolClass>> getAllClassId(String id) async {
    try {
      String uri = '/school/class/$id';

      var response = await dio.get(uri);
      if (response.statusCode == 200) {
        List? data = response.data['data'];
        if (data == null || data.isEmpty) {
          return [];
        } else {
          return data.map((e) => schoolclass.SchoolClass.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> register({
    required String namaLengkap,
    required email,
    required password,
    required String idSekolah,

    required String idKelas,
    required passwordConfirmation,
  }) async {
    try {
      final response = await dio.post('/register',
          data: jsonEncode({
            'namaLengkap': namaLengkap,
            'email': email,
            'password': password,
            "idSekolah" : idSekolah,
            "idKelas" : idKelas, 
            'passwordConfirmation': passwordConfirmation,
            "role": "siswa",
          }));
      _message = response.data['messages'];
      if (response.statusCode == 200) {
        GetStorage().write('token', response.data['data']['accessToken']);
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
