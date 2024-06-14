
import 'dart:convert';

Quiz quizFromJson(String str) => Quiz.fromJson(json.decode(str));

String quizToJson(Quiz data) => json.encode(data.toJson());

class Quiz {
    int? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    String? quizId;
    String? title;
    String? status;

    Quiz({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.quizId,
        this.title,
        this.status,
    });

    factory Quiz.fromJson(Map<String, dynamic> json) => Quiz(
        id: json["ID"],
        createdAt: json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]),
        updatedAt: json["UpdatedAt"] == null ? null : DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        quizId: json["QuizID"],
        title: json["Title"],
        status: json["Status"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt?.toIso8601String(),
        "UpdatedAt": updatedAt?.toIso8601String(),
        "DeletedAt": deletedAt,
        "QuizID": quizId,
        "Title": title,
        "Status": status,
    };
}
