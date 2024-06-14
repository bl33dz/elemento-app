import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_embed_unity_android_example/app/data/models/detail_modul.dart';
import 'package:flutter_embed_unity_android_example/app/data/models/teacher.dart';
import 'package:flutter_embed_unity_android_example/app/helpers/alert_loading.dart';
import 'package:flutter_embed_unity_android_example/app/helpers/alert_success.dart';
import 'package:flutter_embed_unity_android_example/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_embed_unity_android_example/app/services/bionic_reading_service.dart';
import 'package:flutter_embed_unity_android_example/app/services/feedback_service.dart';
import 'package:flutter_embed_unity_android_example/app/services/module_service.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../data/models/school.dart';
import '../../../services/auth_service.dart';

class DetailModuleController extends GetxController {
  late YoutubePlayerController youtubeController;
  TextEditingController textEditing = TextEditingController();
  bool isBionicReading = false;
  bool bionicLoading = false;
  String idTeacher = "";
  bool isLoading = true;
  List<Teacher> teacherList = [];

  DetailModule? detailModul;
  String? getId = Get.arguments['id'];
  @override
  void onInit() async {
    super.onInit();

    await getDetailModul();
    await getSchoolList();
    if (detailModul != null) {
      initYoutube(id: detailModul?.youtubeLink ?? "");
    }
  }

  Future<void> getSchoolList() async {
    isLoading = true;
    teacherList = await ModuleService().getTeacher();
    isLoading = false;
    update();
  }

  void initYoutube({required String id}) {
    youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(id) ?? "",
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  String html = "";
  bool isFullScreen = false;
  void showFullScreen() {
    youtubeController.toggleFullScreenMode();

    update();
  }

  void enableBionicReading(bool? value) {
    isBionicReading = value ?? false;
    getBionicReading();
    update();
  }

  void getBionicReading() async {
    bionicLoading = true;
    for (Bab bab in detailModul!.babs!) {
      if (isBionicReading) {
        html = await BionicReading()
                .getBionicReading(content: bab.description ?? "") ??
            "";
        bionicLoading = false;
      } else {
        html = bab.description ?? "";
        bionicLoading = false;
      }
    }

    update();
  }

  Future<void> getDetailModul() async {
    var data = await ModuleService().getDetailModule(modulId: getId ?? "");
    detailModul = data;

    for (Bab bab in detailModul!.babs!) {
      html += bab.description ?? "";
    }
    isLoading = false;
    update();
  }

  void sendPertanyaan() async {
    Get.defaultDialog(
      title: 'Pengajuan Pertanyaan',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Pilih Pengajuan",
          ),
          DropdownSearch<Teacher>(
            validator: (Teacher? e) {
              if (e == null) {
                return "Mohon diisi terlebih dahulu";
              }
              return null;
            },
            items: teacherList,
            itemAsString: (Teacher e) => e.fullname ?? "",
            dropdownDecoratorProps: const DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(
                hintText: "Pilih Guru",
              ),
            ),
            popupProps: const PopupProps.menu(fit: FlexFit.loose),
            onChanged: (Teacher? e) async {
              if (e == null) {
                return;
              }
              idTeacher = e.idUser ?? "";

              bool feedback = await FeedbackService()
                  .feedback(feedback: textEditing.text, id: idTeacher);
              if (feedback) {
              Get.back();

                alertSuccess(
                  title: 'Sukses menambahkan pernyataan',
                  subtitle:
                      "Sedang menanyakan guru mu pertanyaan yang sedang kamu ajukan",
                );
                textEditing.text = "";
              }

              update();
            },
          ),
        ],
      ),
    );
  }

  void changeDoneModul() async {
    alertLoading();
    bool isDone = await ModuleService().changeStatusProgress(id: getId ?? "");
    Get.back();
    if (isDone) {
      var home = Get.put(HomeController());
      home.getAllList();
      Get.back();
      alertSuccess(
          title: "Selamat menyelesaikan modul",
          subtitle:
              "Whoaa keren kamu sudah menyelesaikan modul ${detailModul?.title ?? ""}");
    }
  }
}
