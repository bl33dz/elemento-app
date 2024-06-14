import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/leaderboard.dart';
import '../controllers/leaderboard_controller.dart';

class LeaderboardView extends GetView<LeaderboardController> {
  const LeaderboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: controller.leaderboardEntries.length,
            itemBuilder: (context, index) {
              Leaderboard entry = controller.leaderboardEntries[index];
              Color bgColor;
              if (index == 0) {
                bgColor = Colors.yellow;
              } else if (index == 1) {
                bgColor = Colors.grey;
              } else if (index == 2) {
                bgColor = Colors.orange;
              } else {
                bgColor = Colors.white;
              }

              return Card(
                color: bgColor,
                child: ListTile(
                  
                  title: Text(entry.name ?? 'Unknown'),
                  subtitle: Text('${entry.score} pts'),
                  trailing: Text('#${index + 1}'),
                ),
              );
            },
          );
        },
      ),
    
    );
  }
}
