import 'package:flutter/material.dart';
import 'package:flutter_embed_unity_android_example/app/modules/modul_tersedia/views/modul_tersedia_view.dart';
import 'package:flutter_embed_unity_android_example/app/modules/setting/controllers/setting_controller.dart';

import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/bottom_nav_controller.dart';

class BottomNavView extends GetView<BottomNavController> {
  const BottomNavView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController(), permanent: true);
    Get.put(SettingController(), permanent: true);
    Get.put(const ModulTersediaView(), permanent: true);

    Get.put(const BottomNavView(), permanent: true);

    return GetBuilder<BottomNavController>(builder: (context) {
      return Scaffold(
        body: controller.page.elementAt(controller.selectedIndex),
        bottomNavigationBar: Container(
            height: 96,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15)),
             
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: const Color(0xFF1E4E5D),
                unselectedLabelStyle: const TextStyle(
                  color: Color(0xFFC3D9E9),
                  fontSize: 12,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                  height: 0.11,
                  letterSpacing: 0.10,
                ),
                selectedLabelStyle: const TextStyle(
                  color: Color(0xFF1E4E5D),
                  fontSize: 12,
                  fontFamily: 'Gilroy-Medium',
                  fontWeight: FontWeight.w500,
                  height: 0.11,
                  letterSpacing: 0.10,
                ),
                unselectedItemColor: const Color(0xFFC3D9E9),
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: Image.asset(
                        'assets/images/home.png',
                        color: controller.selectedIndex == 0
                            ? const Color(0xff1e4e5d)
                            : const Color(0xffc3d9e9),
                        width: 23,
                        height: 23,
                      ),
                    ),
                    label: 'Beranda',
                    tooltip: 'Beranda',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: Image.asset(
                        'assets/images/modules.png',
                        color: controller.selectedIndex == 1
                            ? const Color(0xff1e4e5d)
                            : const Color(0xffc3d9e9),
                        width: 23,
                        height: 23,
                      ),
                    ),
                    label: 'Modul',
                    tooltip: 'Modul',
                  ),
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: Image.asset(
                        'assets/images/settings.png',
                        color: controller.selectedIndex == 2
                            ? const Color(0xff1e4e5d)
                            : const Color(0xffc3d9e9),
                        width: 23,
                        height: 23,
                      ),
                    ),
                    label: 'Pengaturan',
                    tooltip: 'Pengaturan',
                  ),
                ],
                currentIndex: controller.selectedIndex,
                elevation: 0,
                onTap: controller.onItemTapped,
              ),
            )),
      );
    });
  }
}
