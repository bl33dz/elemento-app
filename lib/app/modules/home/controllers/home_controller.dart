import 'dart:async';
import 'package:flutter_embed_unity_android_example/app/services/auth_service.dart';
import 'package:flutter_embed_unity_android_example/app/services/quiz_service.dart';
import 'package:get/get.dart';
import '../../../data/models/modul.dart';
import '../../../data/models/quiz.dart';
import '../../../data/models/user.dart';
import '../../../services/module_service.dart';

class HomeController extends GetxController {
  bool isLoading = true;
  int studyHours = 2;
  bool isGreetingVisible = true;
  bool isReminderVisible = false;
  DateTime? studyStartTime;
  List<Duration> studySessions = [];
  Quiz? selectedQuiz;
  List<Quiz> quiz = [];
  Timer? hourlyTimer;
  User? user;
  Duration elapsedTime = Duration.zero; // Track elapsed time

  List<Module> data = [];

  @override
  void onInit() async {
    super.onInit();
    startStudySession();
    startHourlyTimer();
    await fetchUserData();
    await getAllList();
    await getAllQuiz();
  }

  Future<void> getAllList() async {
    isLoading = true;
    data = await ModuleService().getAllModule();
    isLoading = false;
    update();
  }

  Future<void> getAllQuiz() async {
    isLoading = true;
    quiz = await QuizService().quiz();
    isLoading = false;
    if (quiz.isNotEmpty) {
      selectedQuiz = quiz[0]; // Set initial selected quiz
    }
    update();
  }

  void startStudySession() {
    studyStartTime = DateTime.now();
    update();
  }

  void stopStudySession() {
    if (studyStartTime != null) {
      DateTime endTime = DateTime.now();
      Duration sessionDuration = endTime.difference(studyStartTime!);
      studySessions.add(sessionDuration);
      studyStartTime = null;
      calculateStudyHours();
    }
  }

  void calculateStudyHours() {
    Duration totalDuration =
        studySessions.fold(Duration.zero, (sum, session) => sum + session);
    studyHours = totalDuration.inHours;
    update();
  }

  void startHourlyTimer() {
    hourlyTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      elapsedTime += const Duration(seconds: 1);
      int elapsedSeconds = elapsedTime.inSeconds;
      int elapsedMinutes = elapsedTime.inMinutes;

      print("Elapsed Time: $elapsedMinutes minutes and ${elapsedSeconds % 60} seconds"); // Print elapsed time

      if (elapsedSeconds % 45 == 0) { // Every 2 minutes
        isReminderVisible = true;
        update();
        Future.delayed(const Duration(seconds: 30), () { // Show for 2 minutes
          isReminderVisible = false;
          update();
        });
      }
    });
  }

  Future<void> fetchUserData() async {
    isLoading = true;

    user = await AuthService().getUser();
    isLoading = false;
    update();
  }
}


