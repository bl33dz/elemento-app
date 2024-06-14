import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardingController>(builder: (context) {
      return SafeArea(
        child: Scaffold(
          body: PageView(
            controller: controller.pageViewController,
            onPageChanged: (int index) {
              controller.currentIndex = index;
              controller.update();
            },
            children: [
              onboarding(
                image: "landingpage",
                index: 0,
                title: "Rasakan suasana belajar kimia berbeda",
                description: "Banyak fitur menarik yang wajib dicoba",
                onTap: () => controller.pageViewController.jumpToPage(
                  controller.currentIndex + 1,
                ),
              ),
              onboarding(
                image: "0317",
                index: 1,
                title: "Jelajahi dunia Kimia dengan gaya baru",
                description: "Explorasi hal baru menggunakan Elemento",
                onTap: () => controller.pageViewController.jumpToPage(
                  controller.currentIndex + 1,
                ),
              ),
              onboarding(
                image: "landingpage3",
                index: 2,
                title: "Buat  belajar Kimia menjadi menyenangkan",
                description: "Jadikan dirimu “Einstein” yang baru",
                onTap: () {
                  Get.toNamed(
                    Routes.LOGIN,
                  );
                  GetStorage().write('onboarding_completed',true);
                },
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget onboarding({
    required String image,
    String title = "",
    String description = "",
    int index = 0,
    void Function()? onTap,
  }) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            'assets/lottie/$image.gif',
          ),
          const SizedBox(
            height: 67,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    3,
                    (idx) => Container(
                      margin: const EdgeInsets.only(
                        right: 8.17,
                      ),
                      width: 8.17,
                      height: 8.17,
                      decoration: ShapeDecoration(
                        color: index == idx
                            ? Colors.black
                            : Colors.black.withOpacity(0.2),
                        shape: const CircleBorder(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24.52,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontFamily: 'Gilroy-Bold',
                    letterSpacing: 0.48,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 16.35,
                ),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400,
                    height: 1.0,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  height: 51.70,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onTap,
                    child: const Text(
                      "Selanjutnya",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
