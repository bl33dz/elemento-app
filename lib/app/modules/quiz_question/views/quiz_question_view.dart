import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../theme/color.dart';
import '../controllers/quiz_question_controller.dart';

class QuizQuestionView extends GetView<QuizQuestionController> {
  @override
  const QuizQuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizQuestionController>(builder: (_) {
      return SafeArea(
        child: controller.isLoading
            ? const Material(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                backgroundColor: const Color(0xFF183E4A),
                body: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                            onPressed: controller.previousQuestion,
                          ),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: (controller.currentIndex + 1) / controller.quest.length,
                              backgroundColor: Colors.grey[300],
                              valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Container(
                            width: 75,
                            height: 35,
                            decoration: BoxDecoration(
                              color: const Color(0xffED683A),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/timer.png',
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  controller.formatTime(20 * 60 - controller.timerTick),
                                  style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    height: 0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 28),
                      Ink(
                        width: Get.width,
                        height: Get.height,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${controller.currentIndex + 1} DARI ${controller.quest.length}",
                              style: GoogleFonts.inter(
                                color: const Color(0xFF717375),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                height: 0,
                                letterSpacing: 1.68,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              controller.question?.question ?? "",
                              style: const TextStyle(
                                color: Color(0xFF0A0A0A),
                                fontSize: 20,
                                fontFamily: 'Gilroy',
                                fontWeight: FontWeight.w700,
                                height: 0,
                                letterSpacing: 0.40,
                              ),
                            ),
                            const SizedBox(height: 8),
                            ...?controller.question?.answer?.map((answer) {
                              Color tileColor = Colors.white;
                              TextStyle googleFonts = GoogleFonts.inter(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                height: 0,
                              );
                              Icon? iconData;
                              if (controller.isAnswered) {
                                if (answer.answerId == controller.question?.correctAnswer) {
                                  tileColor = const Color(0xff53DF83);
                                  iconData = const Icon(Icons.check, color: Colors.white);
                                  googleFonts = GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  );
                                } else if (answer.answerId == controller.selectedAnswerId) {
                                  tileColor = const Color(0xffF14545);
                                  iconData = const Icon(Icons.close, color: Colors.white);
                                  googleFonts = GoogleFonts.inter(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    height: 0,
                                  );
                                }
                              }
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(12),
                                  splashColor: pinkColor.withOpacity(0.2),
                                  onTap: () {
                                    if (!controller.isAnswered) {
                                      controller.selectedAnswerId = answer.answerId ?? "";
                                      controller.selectAnswer(controller.selectedAnswerId);
                                    }
                                  },
                                  child: Material(
                                    child: Ink(
                                      width: double.infinity,
                                      decoration: ShapeDecoration(
                                        color: tileColor,
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(width: 1, color: Color(0xFFD8DCDF)),
                                          borderRadius: BorderRadius.circular(12),
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(16),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "${answer.answerTitle}  ${answer.answerSubtitle}",
                                              style: googleFonts,
                                            ),
                                          ),
                                          iconData ?? const SizedBox()
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            if (controller.currentIndex == controller.quest.length - 1)
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: controller.submitQuiz,
                                  child: const Text("Selesai"),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      );
    });
  }
}
