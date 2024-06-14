import 'dart:async';
import 'package:get/get.dart';

import '../../../data/models/answer_question.dart';
import '../../../data/models/question.dart';
import '../../../routes/app_pages.dart';
import '../../../services/quiz_service.dart';

class QuizQuestionController extends GetxController {
  int currentQuestionIndex = 0;
  bool isAnswerCorrect = false;
  bool isAnswered = false;
  String selectedAnswerId = '';
  int timerTick = 0;
  Timer? timer;
  List<Question> quest = [];
  int currentIndex = 0;
  Question? question;
  String id = Get.arguments['id'];
  String name = Get.arguments['name'];

  bool isLoading = true;
  List<Map<String, String>> submittedAnswers = [];

  // void selectAnswer(String answerId) {
  //   isAnswered = true;
  //   selectedAnswerId = answerId;
  //   isAnswerCorrect = answerId == quest[currentIndex].correctAnswer;

  //   // Periksa apakah jawaban yang dipilih sudah ada dalam submittedAnswers
  //   int existingIndex = submittedAnswers.indexWhere(
  //       (answer) => answer['question_id'] == quest[currentIndex].questionId);

  //   // Jika sudah ada, perbarui nilai jawaban
  //   if (existingIndex != -1) {
  //     submittedAnswers[existingIndex]['answer_id'] = selectedAnswerId;
  //   }
  //   // Jika belum ada, tambahkan jawaban yang dipilih
  //   else {
  //     submittedAnswers.add({
  //       "question_id": quest[currentIndex].questionId ?? "",
  //       "answer_id": selectedAnswerId,
  //     });
  //   }

  //   update();
  // }
  void selectAnswer(String answerId) {
    isAnswered = true;
    selectedAnswerId = answerId;
    isAnswerCorrect = answerId == quest[currentIndex].correctAnswer;

    // Periksa apakah jawaban yang dipilih sudah ada dalam submittedAnswers
    int existingIndex = submittedAnswers.indexWhere(
        (answer) => answer['question_id'] == quest[currentIndex].questionId);

    // Jika sudah ada, perbarui nilai jawaban
    if (existingIndex != -1) {
      submittedAnswers[existingIndex]['answer_id'] = selectedAnswerId;
    }
    // Jika belum ada, tambahkan jawaban yang dipilih
    else {
      submittedAnswers.add({
        "question_id": quest[currentIndex].questionId ?? "",
        "answer_id": selectedAnswerId,
      });
    }

    update();

    // Tambahkan delay sebelum melanjutkan ke pertanyaan berikutnya
    Future.delayed(const Duration(seconds: 2), () {
      if (currentIndex < quest.length - 1) {
        nextQuestion();
      }
    });
  }

  void nextQuestion() {
    if (currentIndex < quest.length - 1) {
      currentIndex++;
      question = quest[currentIndex];
      isAnswered = false;
      isAnswerCorrect = false;
      selectedAnswerId = '';

      // Perbarui jawaban yang dipilih sebelumnya jika ada
      var existingAnswer = submittedAnswers.firstWhere(
          (answer) => answer['question_id'] == question?.questionId,
          orElse: () => {});
      if (existingAnswer.isNotEmpty) {
        selectedAnswerId = existingAnswer['answer_id']!;
        isAnswered = true;
      }

      update();
    }
  }

  @override
  void onInit() {
    startTimer();
    fetchAllQuest();
    super.onInit();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      timerTick = timer.tick;
      update();
      if (timer.tick >= 20 * 60) {
        submitQuiz();
        timer.cancel();
      }
      update();
    });
  }

  String formatTime(int totalSeconds) {
    int minutes = totalSeconds ~/ 60;
    int seconds = totalSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }

  void fetchAllQuest() async {
    quest = await QuizService().question(id);
    if (quest.isNotEmpty) {
      question = quest[currentIndex];
      update();
    }
    isLoading = false;
    update();
  }

  void previousQuestion() {
    if (currentIndex == 0) {
      Get.back();
    }
    if (currentIndex > 0) {
      currentIndex--;
      question = quest[currentIndex];
      isAnswered = false;
      isAnswerCorrect = false;
      selectedAnswerId = '';

      // Perbarui jawaban yang dipilih sebelumnya jika ada
      var existingAnswer = submittedAnswers.firstWhere(
          (answer) => answer['question_id'] == question?.questionId,
          orElse: () => {});

      if (existingAnswer.isNotEmpty) {
        selectedAnswerId = existingAnswer['answer_id']!;
        isAnswered = true;
      }

      update();
    }
  }

  void submitQuiz() async {
    try {
      List<Map<String, String>> selectedAnswers = submittedAnswers
          .where((answer) => answer['answer_id'] != null)
          .toList();

      AnswerSubmit? answer =
          await QuizService().submitQuiz(id, selectedAnswers);
      if (answer != null) {
        if (answer.answer!.isNotEmpty) {
          Get.offAllNamed(Routes.SUBMIT_PAGE, arguments: {
            "id": id,
            "submittedAnswers": answer.answer,
            "countAnswer": answer.countAnswer,
            "length": quest.length,
            "name": name
          });
        }else {
           Get.offAllNamed(Routes.SUBMIT_PAGE, arguments: {
            "id": id,
            "submittedAnswers": answer.answer,
            "countAnswer": [],
            "length": quest.length,
            "name": name
          });
        }
      }
      // Redirect ke halaman selanjutnya setelah submit sukses
      // Get.offAllNamed(Routes.SUBMIT_PAGE, arguments: {
      //   "id": id,
      //   "submittedAnswers": submittedAnswers,
      // });
    } catch (e) {
      // Tambahkan penanganan kesalahan jika submit gagal
      print("Gagal mengirim jawaban: $e");
      // Tambahkan logika lain yang sesuai dengan kebutuhan aplikasi
    }
  }
}
