import 'package:get/get.dart';

import '../controllers/detail_molecule_controller.dart';

class DetailMoleculeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailMoleculeController>(
      () => DetailMoleculeController(),
    );
  }
}
