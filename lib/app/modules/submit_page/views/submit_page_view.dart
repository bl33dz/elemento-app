import 'package:flutter/material.dart';
import 'package:flutter_embed_unity_android_example/app/data/models/answer_question.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../routes/app_pages.dart';
import '../controllers/submit_page_controller.dart';

class SubmitPageView extends GetView<SubmitPageController> {
  const SubmitPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double percentage = controller.list.length / controller.length;
    return Scaffold(
      backgroundColor: const Color(0xFF183E4A),
      appBar: AppBar(
        title: const Text('Review Jawaban'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nama Quiz',
                    style: GoogleFonts.inter(
                      color: const Color(0xFF5D5F60),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 0,
                      letterSpacing: 1.68,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${controller.name}',
                    style: const TextStyle(
                      color: Color(0xFF0A0A0A),
                      fontSize: 20,
                      fontFamily: 'Gilroy-Bold',
                      height: 0,
                      letterSpacing: 0.40,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.all(
                      12.5,
                    ),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFFF906A),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      children: [
                        CircularPercentIndicator(
                          radius: 60.0,
                          lineWidth: 8.0,
                          percent: percentage,
                          center: Text(
                            "${(controller.list.length/controller.length * 100).toInt()}",
                            style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          progressColor: Colors.white,
                          backgroundColor: Colors.white.withOpacity(0.3),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Expanded(
                          child: Text(
                            'Kamu menjawab benar dari ${controller.list.length} dari ${controller.length} pertanyaan',
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Jawabanmu",
                    style: TextStyle(
                      color: Color(0xFF0A0A0A),
                      fontSize: 20,
                      fontFamily: 'Gilroy-Bold',
                      height: 0,
                      letterSpacing: 0.40,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: controller.list.length,
                    itemBuilder: (_, index) {
                      Answer data = controller.list[index] as Answer;

                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: CircleAvatar(
                          backgroundColor: const Color(0xff53DF83),
                          child: Text(
                            "${index + 1}",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                        ),
                        title: Text(
                          "${data.titleQuestion}",
                          style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        subtitle: Text(
                          "${data.userAnswerTitle} ${data.userAnswerSubtitle}",
                          style: GoogleFonts.inter(
                            color: const Color(0xFF717375),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEC673A),
                ),
                onPressed: () => Get.toNamed(
                  Routes.LEADERBOARD,
                ),
                child: const Text(
                  "Leaderboard",
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  Get.offAllNamed(Routes.BOTTOM_NAV);
                },
                child: Text(
                  "Selesai",
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
