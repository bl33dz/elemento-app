
import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../splash_1/views/splash_1_view.dart';
import '../controllers/splash_2_controller.dart';

class Splash2View extends GetView<Splash2Controller> {
  const Splash2View({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Splash2Controller>(
      initState: (_) {
        Timer.periodic(
            const Duration(
              seconds: 5,
            ), (timer) {
          controller.checkOnboardingStatus();
          timer.cancel();
        });
      },
      builder: (_) {
        return const Scaffold(
          body: SplashScreen(
            image: "assets/images/mascot_splas.png",
            width: 250.04,
            height: 158.01,
          ),
        );
      },
    );
  }
}
