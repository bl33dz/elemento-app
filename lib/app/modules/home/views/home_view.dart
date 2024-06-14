import 'package:flutter/material.dart';
import 'package:flutter_embed_unity_android_example/app/modules/bottom_nav/controllers/bottom_nav_controller.dart';
import 'package:flutter_embed_unity_android_example/theme/color.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/quiz.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/card_modul.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomeController>(initState: (_) {
        if (GetStorage().read('showDialog') != true) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            // Menampilkan dialog setelah frame pertama dirender
            _showDialog();
          });
        }
      }, builder: (_) {
        return controller.isLoading
            ? const Material(
                child: Center(child: CircularProgressIndicator()),
              )
            : Scaffold(
                body: RefreshIndicator.adaptive(
                  onRefresh: () async {
                    await controller.fetchUserData();
                  },
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildProfile(),
                        const SizedBox(
                          height: 38,
                        ),
                        const Heading(),
                        const SizedBox(
                          height: 24,
                        ),
                        _buildMagicCard(),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 24,
                          ),
                          child: InkWell(
                            onTap: () => Get.toNamed(
                              Routes.DETAIL_MODULE,
                              arguments: {
                                "id": controller.data.last.modulId,
                              },
                            ),
                            child: Ink(
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.41),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0x3FDBE1E8),
                                    blurRadius: 8.79,
                                    offset: Offset(0, 8.11),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                              padding: const EdgeInsets.all(
                                12,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.data.last.title ?? "",
                                    style: const TextStyle(
                                      color: Color(0xFF414141),
                                      fontSize: 12,
                                      fontFamily: 'Gilroy-Bold',
                                      height: 0,
                                      letterSpacing: 0.12,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(children: [
                                    Image.asset(
                                      'assets/images/video-light.png',
                                      width: 24,
                                      height: 24,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Expanded(
                                      child: Text(
                                        "Modul: ${controller.data.last.subtitle}",
                                        style: const TextStyle(
                                          color: Color(0xFF8E8E8E),
                                          fontSize: 12,
                                          fontFamily: 'Gilroy',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                          letterSpacing: 0.12,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ]),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  LinearProgressIndicator(
                                    value: controller.data.last.progress == true
                                        ? 1
                                        : 0,
                                    backgroundColor: Colors.grey[300],
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                      Color(
                                        0xFFFCB114,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 24,
                          ),
                          child: InkWell(
                            child: Ink(
                              padding: const EdgeInsets.all(20),
                              decoration: ShapeDecoration(
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(11),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      DropdownButton<Quiz>(
                                        underline:
                                            const SizedBox(), // Menghilangkan underline
                                        value: controller.selectedQuiz,
                                        icon: const SizedBox
                                            .shrink(), // Hide the default icon
                                        iconSize: 24,
                                        isDense: true,
                                        onChanged: (Quiz? newValue) {
                                          if (newValue != null) {
                                            controller.selectedQuiz = newValue;
                                            controller.update();
                                          }
                                        },
                                        items: controller.quiz.map((Quiz quiz) {
                                          return DropdownMenuItem<Quiz>(
                                            value: quiz,
                                            child: Text(
                                              quiz.title ?? "",
                                              style: const TextStyle(
                                                color: Color(0xFF0A0A0A),
                                                fontSize: 16,
                                                fontFamily: 'Gilroy',
                                                fontWeight: FontWeight.w700,
                                                height: 1.0,
                                                letterSpacing: 0.32,
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                        selectedItemBuilder:
                                            (BuildContext context) {
                                          return controller.quiz
                                              .map<Widget>((Quiz item) {
                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  item.title ?? "",
                                                  style: const TextStyle(
                                                    color: Color(0xFF0A0A0A),
                                                    fontSize: 16,
                                                    fontFamily: 'Gilroy',
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.0,
                                                    letterSpacing: 0.32,
                                                  ),
                                                ),
                                                if (controller.selectedQuiz !=
                                                        null &&
                                                    item ==
                                                        controller.selectedQuiz)
                                                  Image.asset(
                                                    'assets/images/expand-left.png',
                                                  ),
                                              ],
                                            );
                                          }).toList();
                                        },
                                      ),
                                      Container(
                                        width: 73,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color:
                                              controller.selectedQuiz?.status ==
                                                      "finished"
                                                  ? const Color(0xFFC9FBAE)
                                                  : const Color(0xFFF6F9FB),
                                          border: Border.all(
                                            color: controller
                                                        .selectedQuiz?.status ==
                                                    "finished"
                                                ? Colors.transparent
                                                : const Color(0xFF989B9E),
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            controller.selectedQuiz?.status ==
                                                    "finished"
                                                ? "Sudah"
                                                : "Belum",
                                            style: GoogleFonts.inter(
                                              color: controller.selectedQuiz
                                                          ?.status ==
                                                      "finished"
                                                  ? const Color(0xFF009C36)
                                                  : const Color(0xFF717375),
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1.20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/clock.png',
                                        color: const Color(0xff6C6C6C),
                                        width: 24,
                                        height: 24,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      const Text(
                                        "10 Menit",
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 39,
                                    child: ElevatedButton(
                                      onPressed: () => Get.toNamed(
                                        Routes.QUIZ_QUESTION,
                                        arguments: {
                                          "id": controller.selectedQuiz?.quizId,
                                          "name":
                                              controller.selectedQuiz?.title,
                                        },
                                      ),
                                      child: Text(
                                        controller.selectedQuiz?.status ==
                                                "finished"
                                            ? "Coba Ulang Quiz"
                                            : "Mainkan Quiz",
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 39,
                                    child: TextButton(
                                      style: ButtonStyle(
                                        foregroundColor:
                                            MaterialStateProperty.all<Color>(
                                                Colors.white), // Text color
                                        // Button background color
                                        overlayColor: MaterialStateProperty
                                            .resolveWith<Color?>(
                                          (Set<MaterialState> states) {
                                            if (states.contains(
                                                MaterialState.pressed)) {
                                              return pinkColor.withOpacity(
                                                  0.5); // Ripple color when pressed
                                            }
                                            return null; // Default overlay color
                                          },
                                        ),
                                      ),
                                      onPressed: () => Get.toNamed(
                                        Routes.LEADERBOARD,
                                        arguments: {
                                          "id": controller.selectedQuiz?.quizId
                                        },
                                      ),
                                      child: const Text(
                                        'Lihat Leaderboad',
                                        style: TextStyle(
                                          color: Color(0xFF414141),
                                          fontSize: 12,
                                          fontFamily: 'Gilroy',
                                          fontWeight: FontWeight.w400,
                                          height: 0,
                                          letterSpacing: 0.12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        _buildModuleTitle(),
                        const SizedBox(
                          height: 14,
                        ),
                        _buildModuleList(),
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }

  SizedBox _buildModuleList() {
    return SizedBox(
      height: 260,
      child: ListView.builder(
        itemCount: controller.data.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, idx) {
          var data = controller.data[idx];
          return Padding(
            padding: const EdgeInsets.only(
              right: 12,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(
                10,
              ),
              onTap: () {
                Get.toNamed(Routes.DETAIL_MODULE, arguments: {
                  'id': data.modulId,
                });
              },
              child: CardModul(
                image: data.imageUrl ?? "",
                title: data.title ?? "",
                subtitle: data.subtitle ?? "",
              ),
            ),
          );
        },
      ),
    );
  }

  Row _buildModuleTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Modul Tersedia",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Gilroy-Bold',
                height: 0,
              ),
            ),
            Text(
              "Jadilah ahli kimia dalam waktu singkat",
              style: TextStyle(
                color: Color(0xFF7E9DBC),
                fontSize: 12,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: 0.12,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            var bottomNavController = Get.find<BottomNavController>();
            bottomNavController.selectedIndex = 1;
            bottomNavController.update();
          },
          child: const Text(
            "Lihat Semua",
            style: TextStyle(
              color: Color(0xFFFF51A2),
              fontSize: 12,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
      ],
    );
  }

  Stack _buildMagicCard() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              12,
            ),
            color: Colors.white,
          ),
          height: 110,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 106,
              height: 110,
              child: Image.asset(
                'assets/images/mascot.png',
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Jadilah Ilmuwan!",
                    style: TextStyle(
                      fontFamily: "Gilroy-Bold",
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    "Ayo kita bereksperimen!",
                    style: TextStyle(
                      color: Color(
                        0xff90A8BF,
                      ),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      right: 34,
                    ),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(
                          Routes.PERMISSION_CAMERA_SCANNER,
                        );
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                width: 18,
                                height: 18,
                                'assets/images/camera.png',
                              ),
                              const SizedBox(
                                width: 9,
                              ),
                              const Text(
                                "Magic Card",
                                style: TextStyle(
                                  fontFamily: "Gilroy",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Row _buildProfile() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          Image.asset(
            'assets/images/default_foto_profile.png',
          ),
          const SizedBox(
            width: 12,
          ),
          controller.isReminderVisible
              ? Container(
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        bottomLeft: Radius.circular(24),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/bell.png',
                        width: 24,
                        height: 24,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Anda telah belajar selama  ${controller.studyHours} jam",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                          fontFamily: 'Gilroy-Bold',
                          fontWeight: FontWeight.w700,
                          height: 0,
                        ),
                      ),
                    ],
                  ),
                )
              : Visibility(
                  visible: controller.isGreetingVisible,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, ${controller.user?.firstName} ${controller.user?.lastName}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Gilroy-Bold',
                          height: 0,
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Image.asset(
                        "assets/images/waving-hand.png",
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                ),
        ],
      ),
      const SizedBox(),
    ]);
  }

  void _showDialog() {
    Get.dialog(
      Dialog(
        clipBehavior: Clip.none,
        insetPadding: EdgeInsets.zero,
        alignment: Alignment.centerLeft,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        // Isi dialog di sini
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: 237.12,
              height: 400,
              child: Image.asset(
                'assets/images/alert_dialog.png',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  17,
                ),
                color: Colors.white,
              ),
              margin: const EdgeInsets.only(
                left: 120,
                top: 100,
                right: 40,
              ),
              height: 160,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Selamat datang di Elemento',
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.28,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    "Mari jelajahi dunia Kimia yang menyenangkan bersama, buat keajaiban baru disini.",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      color: Color(
                        0xff5D5F60,
                      ),
                      height: 140 / 100,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            8.17,
                          ),
                        ),
                      ),
                      onPressed: () {
                        GetStorage().write('showDialog', true);
                        Get.back();
                      },
                      child: const Text(
                        "Klik untuk lanjut",
                        style: TextStyle(
                          fontFamily: "Gilroy",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Heading extends StatelessWidget {
  const Heading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        text: '"Kimia itu ibarat',
        style: TextStyle(
            color: Colors.black, fontSize: 20, fontFamily: "Gilroy-Bold"),
        children: [
          TextSpan(
            text: " puzzle ",
            style: TextStyle(
              color: Color(
                0xffFF51A2,
              ),
            ),
          ),
          TextSpan(
            text:
                'yang mengasyikkan. Tiap eksperimen akan selalu menyenangkan."',
          ),
        ],
      ),
    );
  }
}
