import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_embed_unity_android_example/app/data/models/answer_question.dart';
import 'package:flutter_embed_unity_android_example/app/data/models/quiz.dart';
import 'package:get_storage/get_storage.dart';

import '../constanta.dart';
import '../data/models/leaderboard.dart';
import '../data/models/question.dart';

class QuizService {
  Future<List<Quiz>> quiz() async {
    try {
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';
      Response response = await dio.get('/quiz');
      if (response.statusCode == 200) {
        List? data = response.data['data'];
        if (data == null || data.isEmpty) {
          return [];
        } else {
          return data.map((e) => Quiz.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Question>> question(String id) async {
    try {
      var uri = 'question-quiz/$id';
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';

      Response response = await dio.get(uri);
      if (response.statusCode == 200) {
        List? data = response.data['data']['Question'];
        if (data == null || data.isEmpty) {
          return [];
        } else {
          return data.map((e) => Question.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<AnswerSubmit?> submitQuiz(
      String quizId, List<Map<String, String>> answers) async {
    try {
      var uri = '/quiz/submit';
      dio.options.headers['Authorization'] =
          'Bearer ${GetStorage().read('token')}';

      Response response = await dio.post(
        uri,
        data: json.encode(
          {
            'quiz_id': quizId,
            'answer': answers,
          },
        ),
      );
      print(response.data);
      print(answers);
      print(dio.options.headers['Authorization']);

      print(quizId);

    if (response.statusCode == 200) {
        return AnswerSubmit.fromJson(response.data['data']);
      }
      return null;
    } catch (e) {
      throw Exception(e);
    }
  }

  // Future<Leaderboard?> leaderBoard(
  //     ) async {
  //   try {
  //     var uri = '/quiz/leaderboard';
  //     dio.options.headers['Authorization'] =
  //         'Bearer ${GetStorage().read('token')}';

  //     Response response = await dio.get(
  //       uri,
  //     );

  //     if (response.statusCode == 200) {
  //       return Leaderboard.fromJson(response.data['data']);
  //     }
  //     return null;
  //   } catch (e) {
  //     throw Exception(e);
  //   }
  // }
  Future<List<Leaderboard>> leaderboard() async {
    try {
      String url = "/quiz/leaderboard";
      dio.options.headers['Authorization'] = "Bearer ${GetStorage().read(
        'token',
      )}";
      Response response = await dio.get(url);
      print(response.data);
      if (response.statusCode == 200) {
        List? data = response.data['data'];
        if (data == null || data.isEmpty) {
          return [];
        } else {
          return data.map((e) => Leaderboard.fromJson(e)).toList();
        }
      }
      return [];
    } catch (e) {
      throw Exception(e);
    }
  }
}
