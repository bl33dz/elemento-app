import 'package:flutter_embed_unity_android_example/app/services/module_service.dart';
import 'package:get/get.dart';

import '../../../data/models/modul.dart';

class ModulTersediaController extends GetxController {
  bool isLoading = true;
  List<Module> data = [];

  @override
  void onInit() async {
    super.onInit();
    await getAllList();
  }

  Future<void> getAllList() async {
    isLoading = true; // Ensure the loading state is set at the beginning
    update(); // Immediately update to reflect the loading state in the UI

    data = await ModuleService().getAllModule();

    isLoading = false; // Set loading state to false
    update(); // Update the UI with the new state and data
  }
}
