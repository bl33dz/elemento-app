// To parse this JSON data, do
//
//     final answerSubmit = answerSubmitFromJson(jsonString);

import 'dart:convert';

AnswerSubmit answerSubmitFromJson(String str) => AnswerSubmit.fromJson(json.decode(str));

String answerSubmitToJson(AnswerSubmit data) => json.encode(data.toJson());

class AnswerSubmit {
    int? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    String? userResultId;
    String? userId;
    String? quizId;
    int? countAnswer;
    int? score;
    List<Answer>? answer;

    AnswerSubmit({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.userResultId,
        this.userId,
        this.quizId,
        this.countAnswer,
        this.score,
        this.answer,
    });

    factory AnswerSubmit.fromJson(Map<String, dynamic> json) => AnswerSubmit(
        id: json["ID"],
        createdAt: json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]),
        updatedAt: json["UpdatedAt"] == null ? null : DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        userResultId: json["UserResultID"],
        userId: json["UserID"],
        quizId: json["QuizID"],
        countAnswer: json["CountAnswer"],
        score: json["Score"],
        answer: json["Answer"] == null ? [] : List<Answer>.from(json["Answer"]!.map((x) => Answer.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt?.toIso8601String(),
        "UpdatedAt": updatedAt?.toIso8601String(),
        "DeletedAt": deletedAt,
        "UserResultID": userResultId,
        "UserID": userId,
        "QuizID": quizId,
        "CountAnswer": countAnswer,
        "Score": score,
        "Answer": answer == null ? [] : List<dynamic>.from(answer!.map((x) => x.toJson())),
    };
}

class Answer {
    int? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    String? userAnswerId;
    String? titleQuestion;
    String? userAnswerTitle;
    String? userAnswerSubtitle;

    Answer({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.userAnswerId,
        this.titleQuestion,
        this.userAnswerTitle,
        this.userAnswerSubtitle,
    });

    factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        id: json["ID"],
        createdAt: json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]),
        updatedAt: json["UpdatedAt"] == null ? null : DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        userAnswerId: json["UserAnswerID"],
        titleQuestion: json["TitleQuestion"],
        userAnswerTitle: json["UserAnswerTitle"],
        userAnswerSubtitle: json["UserAnswerSubtitle"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt?.toIso8601String(),
        "UpdatedAt": updatedAt?.toIso8601String(),
        "DeletedAt": deletedAt,
        "UserAnswerID": userAnswerId,
        "TitleQuestion": titleQuestion,
        "UserAnswerTitle": userAnswerTitle,
        "UserAnswerSubtitle": userAnswerSubtitle,
    };
}
