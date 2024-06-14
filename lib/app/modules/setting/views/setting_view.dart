import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (_) {
        return SafeArea(
          child: controller.isLoading ?  const Material(child: Center(child:CircularProgressIndicator())):  Scaffold(
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    height: Get.height / 3,
                    color: const Color(0xff1E4E5D),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          left: 20,
                          right: 20,
                          top: 60,
                          bottom: 12,
                        ),
                        padding: const EdgeInsets.all(16),
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildProfile(),
                            const SizedBox(
                              height: 20,
                            ),
                            // const Text(
                            //   'Account Settings',
                            //   style: TextStyle(
                            //     color: Color(0xFF979797),
                            //     fontSize: 16,
                            //     fontFamily: 'Gilroy',
                            //     fontWeight: FontWeight.w400,
                            //     height: 0,
                            //   ),
                            // ),
                            // _buildListTile(
                            //   title: "Edit Profile",
                            // ),
                            // _buildListTile(
                            //   title: "Ubah Password",
                            // ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: _buildMagicCard(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 48,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        child: ElevatedButton(
                          onPressed: () => Get.offAllNamed(Routes.LOGIN),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/logout.png',
                                width: 16,
                                height: 16,
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Text(
                                'Logout',
                                style: TextStyle(
                                  color: Color(0xFFFF51A2),
                                  fontSize: 14,
                                  fontFamily: 'Gilroy-Medium',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
    );
  }

  InkWell _buildListTile({
    required String title,
    void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: 'Gilroy-Medium',
                height: 0,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 22,
            color: Color(
              0xff4B4B4B,
            ),
          ),
        ],
      ),
    );
  }

  Row _buildProfile() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          Image.asset(
            'assets/images/default_foto_profile.png',
          ),
          const SizedBox(
            width: 12,
          ),
           Text(
            '${controller.user?.firstName} ${controller.user?.lastName}',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontFamily: 'Gilroy-Bold',
              height: 0,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            width: 6,
          ),
        ],
      ),
    ]);
  }

  Stack _buildMagicCard() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              12,
            ),
            color: Colors.white,
          ),
          height: 110,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 106,
              height: 110,
              child: Image.asset(
                'assets/images/mascot.png',
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Jadilah Ilmuwan!",
                    style: TextStyle(
                      fontFamily: "Gilroy-Bold",
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    "Ayo kita bereksperimen!",
                    style: TextStyle(
                      color: Color(
                        0xff90A8BF,
                      ),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      right: 34,
                    ),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.toNamed(
                          Routes.PERMISSION_CAMERA_SCANNER,
                        );
                      },
                      child: SizedBox(
                        width: double.infinity,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                width: 18,
                                height: 18,
                                'assets/images/camera.png',
                              ),
                              const SizedBox(
                                width: 9,
                              ),
                              const Text(
                                "Magic Card",
                                style: TextStyle(
                                  fontFamily: "Gilroy",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
