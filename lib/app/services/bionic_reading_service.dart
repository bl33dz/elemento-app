import 'package:dio/dio.dart';
import 'package:flutter_embed_unity_android_example/app/constanta.dart';

class BionicReading {
  Future<String?> getBionicReading({required String content}) async {
    dio.options.headers['content-type'] = "application/x-www-form-urlencoded";
    dio.options.headers['x-rapidapi-host'] = "bionic-reading1.p.rapidapi.com";
    dio.options.headers['x-rapidapi-key'] =
        "72ebcaf00amshf504b15f9d25fa3p10d0dbjsnb2b68bf0d35d";
    Response response = await Dio(
      BaseOptions(
        validateStatus: (statusCode) {
          return statusCode! <= 502;
        },
        headers: {
          'x-rapidapi-host': 'fast-reading.p.rapidapi.com',
          'x-rapidapi-key': '72ebcaf00amshf504b15f9d25fa3p10d0dbjsnb2b68bf0d35d'
        },
      ),
    ).get(
      'https://fast-reading.p.rapidapi.com/api/?txt=${Uri.encodeComponent(content)}&lng=id&fix=5&model=m1',

    
    );
    if (response.statusCode == 200) {
      return response.data;
    }
    return null;
  }
}
