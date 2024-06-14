import 'package:flutter/material.dart';
import 'package:flutter_embed_unity/flutter_embed_unity.dart';
import 'package:flutter_embed_unity_android_example/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../theme/color.dart';
import '../controllers/permission_camera_scanner_controller.dart';

class PermissionCameraScannerView
    extends GetView<PermissionCameraScannerController> {
  const PermissionCameraScannerView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: Get.height,
              child: Image.asset(
                "assets/images/background_permission.png",
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 242,
                left: 81,
                right: 32.49,
              ),
              child: RotationTransition(
                turns: const AlwaysStoppedAnimation(-4.74 / 360),
                child: RichText(
                  text: const TextSpan(
                    text: "Untuk menggunakan Magic Card, Anda perlu ",
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: " mengaktifkan",
                        style: TextStyle(
                          color: pinkColor2,
                        ),
                      ),
                      TextSpan(
                        text: " kamera agar bisa melakukan pemindaian kartu",
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 51,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 53,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(
                          0xff1E4E5D,
                        ),
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.SCANNER)?.then((value) => resumeUnity());
                        pauseUnity();
                      },
                      child: Text(
                        "Aktifkan Kamera!",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.25,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 13,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text(
                        "Jangan aktifkan",
                        style: TextStyle(
                          fontFamily: "Gilroy",
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
