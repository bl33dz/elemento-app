import 'package:get/get.dart';

import '../controllers/detail_magic_card_controller.dart';

class DetailMagicCardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailMagicCardController>(
      () => DetailMagicCardController(),
    );
  }
}
