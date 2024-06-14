import 'package:get/get.dart';

import '../../../data/models/user.dart';
import '../../../services/auth_service.dart';

class SettingController extends GetxController {
  bool isLoading = true;
  User? user;
  @override
  void onInit() {
    fetchUserData();
    super.onInit();
  }

  Future<void> fetchUserData() async {
    isLoading = true;

    user = await AuthService().getUser();
    isLoading = false;
    update();
  }
}
