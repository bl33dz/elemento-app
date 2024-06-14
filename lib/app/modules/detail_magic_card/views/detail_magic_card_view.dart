import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../theme/color.dart';
import '../../login/views/login_view.dart';
import '../controllers/detail_magic_card_controller.dart';

class DetailMagicCardView extends GetView<DetailMagicCardController> {
  const DetailMagicCardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailMagicCardController>(initState: (_) {
      if (GetStorage().read('showInformation') != true) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          // Menampilkan dialog setelah frame pertama dirender
          _showDialog();
        });
      }
    }, builder: (_) {
      return controller.isLoading
          ? const Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  primary: true,
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
                          Text(
                            controller.detailMagic?.namaMolekul ?? "",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'Gilroy-Bold',
                              height: 0,
                            ),
                          ),
                          IconButton(
                            onPressed: controller.playPauseAudio,
                            icon: Image.asset(
                              controller.isPaused
                                  ? 'assets/images/pause.png'
                                  : 'assets/images/play.png',
                              width: 24,
                              height: 24,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildContent(),
                    ],
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
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.network(
              controller.detailMagic?.imageUrl ?? "",
              errorBuilder: (_, __, ___) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.asset(
                    'assets/images/image-placeholder-rectangle.png',
                    width: double.infinity,
                    height: 299,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Center(
            child: Text(
              controller.detailMagic?.namaMolekul ?? "",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontFamily: 'Gilroy-Bold',
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Center(
            child: Text(
              controller.detailMagic?.unsurMolekul ?? "",
              style: const TextStyle(
                color: Color(0xFF1D2E42),
                fontSize: 15,
                fontStyle: FontStyle.italic,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Center(
            child: Wrap(
              children: controller.detailMagic?.listSenyawa
                      ?.map(
                        (e) => Padding(
                          padding: const EdgeInsets.only(
                            right: 8,
                            top: 8,
                          ),
                          child: InkWell(
                            onTap: () {
                              Get.defaultDialog(
                                title: "${e.judul ?? ""} ${e.unsur ?? ""}",
                                content: Text(
                                  e.deskripsi ?? "",
                                ),
                              );
                            },
                            child: Ink(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: const Color(0x4FF8BCD8),
                              ),
                              child: Text(
                                e.judul ?? "",
                                style: const TextStyle(
                                  color: Color(0xFFF38DB7),
                                  fontSize: 14,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList() ??
                  [],
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
                              children: [
                                Text(
                                  "Materi ${controller.detailMagic?.namaMolekul ?? ""}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontFamily: 'Gilroy-Bold',
                                    height: 0,
                                  ),
                                ),
                                HtmlWidget(
                                  controller.html ?? "",
                                  customStylesBuilder: (element) {
                                    if (element.localName != "b") {
                                      return {'text-align': 'justify'};
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
                            ),
                          ),
                        ),
                      ),
                    )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Materi ${controller.detailMagic?.namaMolekul ?? ""}",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Gilroy-Bold',
                        height: 0,
                      ),
                    ),
                    Text(
                      controller.content,
                      style: GoogleFonts.inter(
                        fontSize: 12.0,
                        height: 3,
                      ),
                    ),
                  ],
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
                  'Buat Pertanyaan ${controller.detailMagic?.namaMolekul}',
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
        ],
      ),
    );
  }

  void _showDialog() {
    Get.dialog(
      Dialog(
        clipBehavior: Clip.none,
        insetPadding: EdgeInsets.zero,
        alignment: Alignment.centerLeft,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        // Isi dialog di sini
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SizedBox(
              width: 237.12,
              height: 400,
              child: Image.asset(
                'assets/images/alert_dialog.png',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  17,
                ),
                color: Colors.white,
              ),
              margin: const EdgeInsets.only(
                left: 120,
                top: 100,
                right: 40,
              ),
              height: 300,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Fitur Molekul',
                    style: TextStyle(
                      fontFamily: "Gilroy",
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.28,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Halo',
                          style: TextStyle(
                            color: Color(0xFF5D5F60),
                            fontSize: 12,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: ' Elemento!,\n',
                          style: TextStyle(
                            color: Color(0xFF5D5F60),
                            fontSize: 12,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text:
                              'disini kamu dapat menggunakan fitur yang sudah kami sediakan seperti :',
                          style: TextStyle(
                            color: Color(0xFF5D5F60),
                            fontSize: 12,
                            fontFamily: 'Gilroy',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: Text(
                      '1. AR Molekul\n2. Bionic Reading\n3. Tanya Guru',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Color(0xFF5D5F60),
                        fontSize: 12,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Text(
                    'Semoga fitur kami dapat membantu kalian dalam belajar kimia',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Color(0xFF5D5F60),
                      fontSize: 12,
                      fontFamily: 'Gilroy',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            8.17,
                          ),
                        ),
                      ),
                      onPressed: () {
                        GetStorage().write('showInformation', true);
                        Get.back();
                      },
                      child: const Text(
                        "Klik untuk lanjut",
                        style: TextStyle(
                          fontFamily: "Gilroy",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
