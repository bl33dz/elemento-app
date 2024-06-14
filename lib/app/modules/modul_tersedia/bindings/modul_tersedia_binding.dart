import 'package:get/get.dart';

import '../controllers/modul_tersedia_controller.dart';

class ModulTersediaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModulTersediaController>(
      () => ModulTersediaController(),
    );
  }
}
