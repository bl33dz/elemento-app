import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';

class Splash2Controller extends GetxController {
  void checkOnboardingStatus() {
    final box = GetStorage();
    Get.offAllNamed(Routes.ONBOARDING);
    // bool onboardingCompleted = box.read('onboarding_completed') ?? false;
    // String isHaveToken = box.read('token') ?? "";
    // if (onboardingCompleted && isHaveToken.isNotEmpty) {
    //   Get.offAllNamed(Routes.BOTTOM_NAV);
    // } else if (onboardingCompleted) {
    //   Get.offAllNamed(Routes.LOGIN);
    // } else {
    //   Get.offAllNamed(Routes.ONBOARDING);
    // }
  }
}
