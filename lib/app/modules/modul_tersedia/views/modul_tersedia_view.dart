import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../data/models/modul.dart';
import '../../../routes/app_pages.dart';
import '../../../widgets/card_modul.dart';
import '../controllers/modul_tersedia_controller.dart';

class ModulTersediaView extends GetView<ModulTersediaController> {
  const ModulTersediaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(ModulTersediaController());
    return GetBuilder<ModulTersediaController>(builder: (context) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 31,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Modul tersedia',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Gilroy-Bold',
                    height: 0,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  'Jadilah ahli kimia dalam waktu singkat',
                  style: TextStyle(
                    color: Color(0xFF7E9DBC),
                    fontSize: 12,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: 0.12,
                  ),
                ),
                controller.isLoading
                    ? ListView.builder(itemCount: 5,itemBuilder: (context, indx) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: const CardModul(
                            width: double.infinity,
                            image:
                                "assets/images/image-placeholder-rectangle.png",
                            title: "",
                            subtitle: "",
                          ),
                        );
                      })
                    : ListView.builder(
                        itemCount: controller.data.length,
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, idx) {
                          Module data = controller.data[idx];
                          return Padding(
                            padding: const EdgeInsets.only(
                              right: 12,
                              top: 20,
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              onTap: () => Get.toNamed(
                                Routes.DETAIL_MODULE,
                                arguments : {
                                  'id' : data.modulId,
                                }
                              ),
                              child: CardModul(
                                width: double.infinity,
                                image: "${data.imageUrl}",
                                title: "${data.title}",
                                subtitle: "${data.subtitle}",
                                height: 320,
                              ),
                            ),
                          );
                        },
                      ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
