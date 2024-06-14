import 'package:flutter/material.dart';
import 'package:flutter_embed_unity/flutter_embed_unity.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../routes/app_pages.dart';
import '../controllers/scanner_controller.dart';

class ScannerView extends GetView<ScannerController> {
  const ScannerView({super.key});
  @override
  Widget build(BuildContext context) {
    ScannerController scanner = Get.put(
      ScannerController(),
      permanent: true,
    );
    return GetBuilder<ScannerController>(builder: (_) {
      return SafeArea(
        child: scanner.isLoading
            ? const Material(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : Scaffold(
                key: scanner.scaffoldKey,
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 42,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                                pauseUnity();
                              },
                              borderRadius: BorderRadius.circular(12),
                              child: Ink(
                                width: 40,
                                height: 40,
                                padding: const EdgeInsets.all(8),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  shadows: const [
                                    BoxShadow(
                                      color: Color(0x99ECF3F6),
                                      blurRadius: 15,
                                      offset: Offset(0, 15),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Image.asset(
                                  "assets/images/fi.png",
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              "Magic Card",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Gilroy-Bold',
                                height: 0,
                              ),
                            ),
                            const Spacer(),
                            const SizedBox(width: 40),
                          ],
                        ),
                        
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 24,
                            ),
                            SizedBox(
                              height: 382,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  12,
                                ),
                                child: EmbedUnity(
                                  onMessageFromUnity: (data) {
                                    print("checkkkkkk false $data");

                                    if (data == "ar:false") {
                                      scanner.isUnityArSupportedOnDevice =
                                          false;

                                      scanner.update();
                                    } else if (data == "ar:true") {
                                      scanner.isUnityArSupportedOnDevice = true;

                                      scanner.update();
                                    }
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            const Text(
                              "Daftar Molekul",
                              style: TextStyle(
                                color: Color(0xFF1D2E42),
                                fontSize: 16,
                                fontFamily: 'Gilroy-Bold',
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Anda bisa memilih daftar molekul dibawah ${scanner.isUnityArSupportedOnDevice}",
                              style: const TextStyle(
                                color: Color(0xFF90A8BF),
                                fontSize: 16,
                                fontFamily: 'Gilroy',
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: scanner.listModul.length,
                              itemBuilder: (_, index) {
                                var data = scanner.listModul[index];
                                return ListTileSenyawa(
                                  image: data.imageUrl ?? "",
                                  title: data.unsurMolekul ?? "",
                                  subtitle: data.description ?? "",
                                  onTap: () {
                                    Get.toNamed(Routes.DETAIL_MAGIC_CARD,
                                        arguments: {
                                          'id': data.id,
                                        })?.then((value) => resumeUnity());
                                    pauseUnity();
                                  },
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
      );
    });
  }
}

class ListTileSenyawa extends StatelessWidget {
  const ListTileSenyawa({
    super.key,
    this.title = "",
    this.subtitle = "",
    required this.image,
    this.onTap,
  });
  final String title;
  final String subtitle;
  final String image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(
        12,
      ),
      child: Ink(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Color(0x99ECF3F6),
              blurRadius: 15,
              offset: Offset(0, 15),
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(
          16,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(143, 195, 198, 0.1),
              borderRadius: BorderRadius.circular(
                12,
              ),
            ),
            child: Center(
              child: ClipRRect(
                child: Image.network(
                  image,
                  errorBuilder: (_, __, ___) {
                    return Image.asset(
                      'assets/images/air.png',
                    );
                  },
                ),
              ),
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              color: Color(0xFF1D2E42),
              fontSize: 16,
              fontFamily: 'Gilroy-Bold',
              fontWeight: FontWeight.w700,
            ),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(
              top: 8,
            ),
            child: Text(
              subtitle,
              style: const TextStyle(
                color: Color(0xFF90A8BF),
                fontSize: 14,
                fontFamily: 'Gilroy',
                height: 0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
