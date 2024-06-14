import 'package:dio/dio.dart';

const apiUrl = "https://getcrew-api.inditesting.com/crew";
Dio dio = Dio(

  BaseOptions(
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
    },
    baseUrl: "https://elemento-api.fly.dev/api/v1/",
    validateStatus: (statusCode) {
      return statusCode! <= 502; 
    },
  ),
);