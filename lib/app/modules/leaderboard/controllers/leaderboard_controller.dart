import 'package:get/get.dart';
import '../../../data/models/leaderboard.dart';
import '../../../services/quiz_service.dart';

class LeaderboardController extends GetxController {
  var leaderboardEntries = <Leaderboard>[].obs;
  var isLoading = true.obs;
  var currentPosition = 0.obs; // Variable untuk menyimpan posisi saat ini
  var previousPosition = 0.obs; // Variable untuk menyimpan posisi sebelumnya

  @override
  void onInit() {
    super.onInit();
    fetchLeaderboard();
  }

  void fetchLeaderboard() async {
    isLoading(true);
    try {
      var entries = await QuizService().leaderboard();

      // Simpan posisi sebelumnya sebelum memperbarui data leaderboard
      previousPosition.value = currentPosition.value;

      // Perbarui leaderboardEntries
      leaderboardEntries.assignAll(entries
        ..sort((a, b) => b.score!.compareTo(a.score!)));

      // Cari posisi saat ini setelah memperbarui data leaderboard
      currentPosition.value = leaderboardEntries.indexWhere((entry) => entry.studentId == "userId");

    } finally {
      isLoading(false);
    }
  }

  // Metode untuk mengupdate posisi saat retake dilakukan
  void updatePosition(List<Leaderboard> updatedEntries) {
    // Update posisi sebelumnya
    previousPosition.value = currentPosition.value;

    // Cari posisi saat ini setelah pembaruan data leaderboard
    currentPosition.value = updatedEntries.indexWhere((entry) => entry.studentId == "userId");

    // Perbarui leaderboardEntries dengan data terbaru
    leaderboardEntries.assignAll(updatedEntries
      ..sort((a, b) => b.score!.compareTo(a.score!)));
  }
}
