import 'package:flutter/material.dart';
import 'package:get/get.dart';

void alertLoading() {
  Get.defaultDialog(
    title: 'Tunggu sebentar ya',
    content: const Center(
      child: CircularProgressIndicator(
        
        valueColor: AlwaysStoppedAnimation<Color>(
          Color(0xffFF4D00),
        ),
      ),
    ),
  );
}
