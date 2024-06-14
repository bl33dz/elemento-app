
import 'dart:convert';

Leaderboard leaderboardFromJson(String str) => Leaderboard.fromJson(json.decode(str));

String leaderboardToJson(Leaderboard data) => json.encode(data.toJson());

class Leaderboard {
    String? id;
    String? studentId;
    int? score;
    String? name;

    Leaderboard({
        this.id,
        this.studentId,
        this.score,
        this.name,
    });

    factory Leaderboard.fromJson(Map<String, dynamic> json) => Leaderboard(
        id: json["id"],
        studentId: json["student_id"],
        score: json["score"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "student_id": studentId,
        "score": score,
        "name": name,
    };
}
