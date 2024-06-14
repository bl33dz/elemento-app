import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_embed_unity_android_example/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../../theme/color.dart';
import '../controllers/splash_1_controller.dart';

class Splash1View extends GetView<Splash1Controller> {
  const Splash1View({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Splash1Controller>(
      initState: (_) {
        Timer.periodic(
          const Duration(seconds: 5),
          (timer) {
            Get.offAllNamed(
              Routes.SPLASH_2,
            );
            timer.cancel();
          },
        );
      },
      builder: (_) {
        return const Scaffold(
          backgroundColor: pinkColor,
          body: SplashScreen(
            width: double.infinity,
            height:350,
          ),
        );
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  final String image;
  final String? title;
  final String? subtitle;
  final double? width;
  final double? height;
  final String title2;
  const SplashScreen({
    super.key,
    this.image = "",
    this.title,
    this.subtitle,
    this.width, 
    this.height,
    this.title2 = "",
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image.isEmpty
              ? Image.asset(
                  "assets/lottie/splash.gif",
                  width: width,
                  height: height,
                  fit:BoxFit.cover
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      image,
                      width: width,
                      height: height,
                    ),
                    const SizedBox(
                      height: 18.93,
                    ),
                    RichText(
                      text: const TextSpan(
                        text: "ELEMENT",
                        style: TextStyle(
                          fontFamily: "PoetsenOne",
                          fontSize: 52.37,
                          color: Color(0xff2B5F6C),
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: "O",
                            style: TextStyle(
                              fontFamily: "PoetsenOne",
                              color: pinkColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                   
                    Text(
                      "Belajar menyenangkan dan mengasikan",
                      style: GoogleFonts.inconsolata(
                          fontSize: 10.49,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 1.573),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
