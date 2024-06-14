
import 'package:dio/dio.dart';
import 'package:flutter_embed_unity_android_example/app/constanta.dart';
import 'package:flutter_embed_unity_android_example/app/data/models/detail_modul.dart';
import 'package:get_storage/get_storage.dart';

import '../data/models/modul.dart';
import '../data/models/teacher.dart';

class ModuleService {
  Future<List<Module>> getAllModule() async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      Response response = await dio.get('module');
      if (response.statusCode == 200) {
        List? data =
           response.data['data'];
        if (data == null || data.isEmpty) {
          return [];
        } else {
          return data.map((e) => Module.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<DetailModule?> getDetailModule({required String modulId}) async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      Response response = await dio.get('module/$modulId');
      if(response.statusCode == 200) {
        return DetailModule.fromJson(response.data['data']);
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }
   Future<List<Teacher>> getTeacher() async {
    try {
      String uri = '/teacher';

      var response = await dio.get(uri);
      print("teacher ${response.data}");
      if (response.statusCode == 200) {
        List? data = response.data['data'];
        if (data == null || data.isEmpty) {
          return [];
        } else {
          return data.map((e) =>Teacher.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<bool> changeStatusProgress({required String id}) async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      Response response = await dio.patch('/change-status-modul/$id');
      print(response.data);
      if(response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      throw Exception(e);
    }
  }
}
