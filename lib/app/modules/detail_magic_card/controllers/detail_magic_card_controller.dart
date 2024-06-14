import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_embed_unity_android_example/app/data/models/detail_magic.dart';
import 'package:flutter_embed_unity_android_example/app/services/magic_service.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:just_audio/just_audio.dart';

import '../../../data/models/teacher.dart';
import '../../../helpers/alert_loading.dart';
import '../../../helpers/alert_success.dart';
import '../../../services/bionic_reading_service.dart';
import '../../../services/feedback_service.dart';
import '../../../services/module_service.dart';

class DetailMagicCardController extends GetxController {
  final YoutubePlayerController youtubeController = YoutubePlayerController(
    initialVideoId: 'iLnmTe5Q2Qw',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );
  final AudioPlayer audioPlayer = AudioPlayer();
  bool isArActive = false;
  void changeAr() {
    isArActive = !isArActive;
    print(isArActive);
    update();
  }

  bool isLoading = true;
  var getId = Get.arguments['id'];
  bool isBionicReading = false;
  bool bionicLoading = false;
  bool isPaused = false;
  String content =
      "Pernahkah sobat elemen melihat kembang api??? \n Nah kalau sobat elemen perhatikan, saat kembang api menghasilkan warna-warna yang berbeda. \n Pembakaran kembang api adalah satu jenis reaksi kimia. \n Namun, apa berarti semua reaksi kimia menghasilkan warna-warni yang indah?? \n Jawabannya TIDAK. Setiap zat kimia bisa menghasilkan reaksi yang berbeda, bisa hanya berupa warna-warni, bahkan hingga ledakan yang dahsyat. Nahhh, perbedaan reaksi itu karena perbedaan konfigurasi electron dari tiap atom. Konfigurasi elektron itu adalah susunan elektron berdasarkan kulit atau orbital dari suatu atom. Secara umum, ada dua jenis ini konfigurasinya, yaitu secara kulit (teori atom Bohr) dan secara sub-kulit (teori atom Mekanika Kuantum). Yuk kita pelajari perbedaannya. Pernahkah sobat elemen melihat kembang api??? Nah kalau sobat elemen perhatikan, saat kembang api menghasilkan warna-warna yang berbeda. Pembakaran kembang api adalah satu jenis reaksi kimia. Namun, apa berarti semua reaksi kimia menghasilkan warna-warni yang indah?? Jawabannya TIDAK. Setiap zat kimia bisa menghasilkan reaksi yang berbeda, bisa hanya berupa warna-warni, bahkan hingga ledakan yang dahsyat. Nahhh, perbedaan reaksi itu karena perbedaan konfigurasi electron dari tiap atom. Konfigurasi elektron itu adalah susunan elektron berdasarkan kulit atau orbital dari suatu atom. Secara umum, ada dua jenis ini konfigurasinya, yaitu secara kulit (teori atom Bohr) dan secara sub-kulit (teori atom Mekanika Kuantum). Yuk kita pelajari perbedaannya.";
  String? html = "";
  bool isFullScreen = false;
  DetailMagic? detailMagic = DetailMagic();
  TextEditingController textEditing = TextEditingController();
  List<AudioSource> audioSources = [];
  String idTeacher = "";
  @override
  void onInit() async {
    super.onInit();
    await getSchoolList();

    await getDetailModul();
    if (detailMagic != null) {
      content = detailMagic?.description ?? "";
      audioSources.add(AudioSource.uri(Uri.parse(detailMagic?.audio ?? "")));
      for (var senyawa in detailMagic?.listSenyawa ?? []) {
        audioSources.add(AudioSource.uri(Uri.parse(senyawa.audio ?? "")));
      }
      final playlist = ConcatenatingAudioSource(
        useLazyPreparation: true,
        shuffleOrder: DefaultShuffleOrder(),
        children: audioSources,
      );
      await audioPlayer.setAudioSource(
          LoopingAudioSource(child: playlist, count: 1)); // Loop the playlist
      update();
    }
  }

  Future<void> getSchoolList() async {
    isLoading = true;
    teacherList = await ModuleService().getTeacher();
    isLoading = false;
    update();
  }

  @override
  void onClose() {
    audioPlayer.dispose();
    super.onClose();
  }

  void playPauseAudio() async {
    if (audioPlayer.playing) {
      audioPlayer.pause();
      isPaused = true;
    } else {
      if (audioPlayer.processingState == ProcessingState.completed) {
        await audioPlayer.seek(Duration.zero,
            index: 0); // Restart from beginning
      }
      audioPlayer.play();
      isPaused = false;
    }
    update();
  }

  List<Teacher> teacherList = [];
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

  // void sendPertanyaan() async {
  //   alertLoading();
  //   bool feedback =
  //       await FeedbackService().feedback(feedback: textEditing.text);
  //   Get.back();
  //   if (feedback) {
  //     alertSuccess(
  //       title: 'Sukses menambahkan pernyataan',
  //       subtitle:
  //           "Sedang menanyakan guru mu pertanyaan yang sedang kamu ajukan",
  //     );
  //     textEditing.text = "";
  //   }
  // }

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
    if (isBionicReading) {
      html = await BionicReading().getBionicReading(content: content);
      bionicLoading = false;
    } else {
      html = content;
      bionicLoading = false;
    }
    update();
  }

  Future<void> getDetailModul() async {
    var data = await MagicService().getDetailMagic(id: getId ?? "");
    detailMagic = data;
    isLoading = false;
    update();
  }
}
