import 'package:flutter/material.dart';
import 'package:flutter_embed_unity_android_example/app/services/magic_service.dart';
import 'package:get/get.dart';

import '../../../data/models/magic.dart';

class ScannerController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  List<Magic> listModul = [];
  bool isLoading = true;
  bool isUnityArSupportedOnDevice = false;
  @override
  void onInit() async {
    super.onInit();
    getModul();
  }

  void getModul() async {
    listModul = await MagicService().getAllMagic();
    isLoading = false;
    update();
  }
  bool? isSupported;

  Future<void> checkPlataformState() async {

  
    isSupported = isSupported;
    update();
  }

  void checkUnity() async {
    update();
  }
}
