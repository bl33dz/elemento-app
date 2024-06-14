import 'package:flutter/material.dart';
import 'package:flutter_embed_unity_android_example/theme/color.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();

  runApp(
    GetMaterialApp(
      title: "Elemento",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: const Color(0xffF8F9FD),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff183E4A),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
            fillColor: const Color(0xffF8F9FD),
            filled: true,
            hintStyle: const TextStyle(
              color: Color(0xFF90A8BF),
              fontSize: 14,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w400,
              height: 0.11,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: pinkColor,
              ),
            )),
        checkboxTheme: CheckboxThemeData(
          side: const BorderSide(color: Color(0xffFF7A00)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              6,
            ),
            side: BorderSide.none,
          ),
          checkColor: const MaterialStatePropertyAll(
            Colors.white,
          ),
          splashRadius: 0.2,
        ),
      ),
    ),
  );
}
