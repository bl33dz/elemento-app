import 'package:get/get.dart';

import '../controllers/permission_camera_scanner_controller.dart';

class PermissionCameraScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PermissionCameraScannerController>(
      () => PermissionCameraScannerController(),
    );
  }
}
