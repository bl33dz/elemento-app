import 'package:get/get.dart';

import '../controllers/detail_module_controller.dart';

class DetailModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailModuleController>(
      () => DetailModuleController(),
    );
  }
}
