import 'package:flutter_embed_unity_android_example/app/data/models/detail_magic.dart';
import 'package:get_storage/get_storage.dart';

import '../constanta.dart';
import '../data/models/magic.dart';

class MagicService {
  Future<List<Magic>> getAllMagic() async {
    try {
      String uri = '/magic-card';
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      var response = await dio.get(uri);
      if (response.statusCode == 200) {
        List? data = response.data['data'];
        if (data == null || data.isEmpty) {
          return [];
        } else {
          return data.map((e) => Magic.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<DetailMagic?> getDetailMagic({String? id}) async {
    try {
      String uri = '/magic-card/$id';
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      var response = await dio.get(uri);
      if (response.statusCode == 200) {
        return DetailMagic.fromJson(response.data['data']);
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }
}
