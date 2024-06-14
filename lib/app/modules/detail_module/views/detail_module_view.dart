import 'package:flutter/material.dart';
import 'package:flutter_embed_unity_android_example/app/modules/login/views/login_view.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../theme/color.dart';
import '../controllers/detail_module_controller.dart';

class DetailModuleView extends GetView<DetailModuleController> {
  const DetailModuleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailModuleController>(builder: (_) {
      return controller.isLoading
          ? const Material(child: Center(child: CircularProgressIndicator()))
          : Scaffold(
              body: YoutubePlayerBuilder(
                onEnterFullScreen: () {
                  controller.isFullScreen = true;
                  controller.update();
                },
                onExitFullScreen: () {
                  controller.isFullScreen = false;
                  controller.update();
                },
                player: YoutubePlayer(
                  width: double.infinity,
                  controller: controller.youtubeController,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: const Color(
                    0xFFF8BCD8,
                  ),
                  onReady: () {
                    controller.youtubeController.addListener(() {});
                  },
                  bottomActions: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                        onPressed: controller.showFullScreen,
                        icon: const Icon(
                          Icons.fullscreen,
                        ),
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                builder: (context, player) => SafeArea(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => Get.back(),
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
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(14.58),
                            child: player,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        _buildContent(),
                      ],
                    ),
                  ),
                ),
              ),
            );
    });
  }

  Visibility _buildContent() {
    return Visibility(
      visible: !controller.isFullScreen,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: RichText(
              text: const TextSpan(
                text: "ELEMENT",
                style: TextStyle(
                  fontFamily: "PoetsenOne",
                  fontSize: 14,
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
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: Text(
              controller.detailModul?.title ?? "",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Gilroy-Bold',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 17,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 12,
            ),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.41),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x3FDBE1E8),
                  blurRadius: 8.79,
                  offset: Offset(0, 8.11),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Row(
              children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mode Bionic Reading",
                        style: TextStyle(
                          color: Color(0xFF414141),
                          fontSize: 14,
                          fontFamily: 'Gilroy-Bold',
                          height: 0,
                          letterSpacing: 0.12,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Aktifkan untuk mendapatkan pengalaman baru",
                        style: TextStyle(
                          color: Color(0xFF414141),
                          fontSize: 12,
                          fontFamily: 'Gilroy',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: 0.08,
                        ),
                      ),
                    ],
                  ),
                ),
                FlutterSwitch(
                  width: 50,
                  height: 20,
                  valueFontSize: 12.0,
                  toggleSize: 12.0,
                  value: controller.isBionicReading,
                  activeTextColor: Colors.white,
                  activeColor: const Color(0xFF17DB94),
                  borderRadius: 60.0,
                  activeText: "ON",
                  inactiveText: "OFF",
                  showOnOff: true,
                  onToggle: controller.enableBionicReading,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          controller.isBionicReading
              ? controller.bionicLoading
                  ? const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 80,
                      ),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: pinkColor2,
                        ),
                      ),
                    )
                  : Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(
                          12,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x3FDBE1E8),
                            blurRadius: 8.79,
                            offset: Offset(0, 8.11),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: RawScrollbar(
                        thumbVisibility: true,
                        thumbColor: pinkColor2,
                        padding:
                            const EdgeInsets.only(right: 4, top: 8, bottom: 8),
                        radius: const Radius.circular(
                          12,
                        ),
                        child: SingleChildScrollView(
                          primary: false,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    controller.detailModul!.babs!.map((detail) {
                                  return Column(
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Materi ${detail.title}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontFamily: 'Gilroy-Bold',
                                          height: 0,
                                        ),
                                      ),
                                      HtmlWidget(
                                        controller.html,
                                        customStylesBuilder: (element) {
                                          if (element.localName != "b") {
                                            return {'text-align': 'justify'};
                                          } else if (element.innerHtml
                                              .contains('.')) {
                                            // Return the desired CSS property and add a newline character
                                            return {
                                              "display": "block",
                                            };
                                          } else {
                                            return {'text-align': 'justify'};
                                          }
                                        },
                                        textStyle: GoogleFonts.inter(
                                          fontSize: 12.0,
                                          height: 3,
                                        ),
                                      ),
                                    ],
                                  );
                                }).toList()),
                          ),
                        ),
                      ),
                    )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: controller.detailModul!.babs!.map((detail) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Materi ${detail.title ?? ""}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Gilroy-Bold',
                            height: 0,
                          ),
                        ),
                        Text(
                          controller.html.replaceAll(".", "\n"),
                          style: GoogleFonts.inter(
                            fontSize: 12.0,
                            height: 3,
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
          const SizedBox(
            height: 12,
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(
              12,
            ),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Buat Pertanyaan Anda',
                  style: TextStyle(
                    color: Color(0xFF1D2E42),
                    fontSize: 12,
                    fontFamily: 'Gilroy-Bold',
                    height: 0,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Buat Pertanyaan ${controller.detailModul?.title}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w400,
                    height: 0.12,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                TextEditing(
                  hint: "Tulis Pertanyaan disini",
                  controller: controller.textEditing,
                  maxLines: 5,
                  onEditingComplete: controller.sendPertanyaan,
                ),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 40,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: controller.changeDoneModul,
              child: const Text('Selesaikan Modul'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
