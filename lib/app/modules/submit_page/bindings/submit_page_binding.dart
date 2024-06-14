import 'package:get/get.dart';

import '../controllers/submit_page_controller.dart';

class SubmitPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubmitPageController>(
      () => SubmitPageController(),
    );
  }
}
