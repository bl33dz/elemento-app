import 'package:flutter/material.dart';
import 'package:flutter_embed_unity_android_example/app/modules/modul_tersedia/views/modul_tersedia_view.dart';
import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../../setting/views/setting_view.dart';

class BottomNavController extends GetxController {
  int selectedIndex = 0;
  List<Widget> page = [
    const HomeView(),
    const ModulTersediaView(),
    const SettingView(),
    
  ];
  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }
}
