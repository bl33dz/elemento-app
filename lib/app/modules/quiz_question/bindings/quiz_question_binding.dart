import 'package:get/get.dart';

import '../controllers/quiz_question_controller.dart';

class QuizQuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizQuestionController>(
      () => QuizQuestionController(),
    );
  }
}
