import 'dart:convert';

import 'package:get_storage/get_storage.dart';

import '../constanta.dart';

class FeedbackService {
  Future<bool> feedback({String feedback = "", required String id}) async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      var response = await dio.post(
        '/feedback',
        data: jsonEncode(
          {
            "teacher_id": id,
            "feedback": feedback,
          },
        ),
      );

      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }
}
