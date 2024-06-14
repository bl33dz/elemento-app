// To parse this JSON data, do
//
//     final question = questionFromJson(jsonString);

import 'dart:convert';

Question questionFromJson(String str) => Question.fromJson(json.decode(str));

String questionToJson(Question data) => json.encode(data.toJson());

class Question {
    int? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    String? questionId;
    String? quizId;
    String? question;
    List<Answer>? answer;
    String? correctAnswer;

    Question({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.questionId,
        this.quizId,
        this.question,
        this.answer,
        this.correctAnswer,
    });

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["ID"],
        createdAt: json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]),
        updatedAt: json["UpdatedAt"] == null ? null : DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        questionId: json["QuestionID"],
        quizId: json["QuizID"],
        question: json["Question"],
        answer: json["Answer"] == null ? [] : List<Answer>.from(json["Answer"]!.map((x) => Answer.fromJson(x))),
        correctAnswer: json["CorrectAnswer"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt?.toIso8601String(),
        "UpdatedAt": updatedAt?.toIso8601String(),
        "DeletedAt": deletedAt,
        "QuestionID": questionId,
        "QuizID": quizId,
        "Question": question,
        "Answer": answer == null ? [] : List<dynamic>.from(answer!.map((x) => x.toJson())),
        "CorrectAnswer": correctAnswer,
    };
}

class Answer {
    int? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    String? answerId;
    String? answerTitle;
    String? answerSubtitle;
    String? questionId;

    Answer({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.answerId,
        this.answerTitle,
        this.answerSubtitle,
        this.questionId,
    });

    factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        id: json["ID"],
        createdAt: json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]),
        updatedAt: json["UpdatedAt"] == null ? null : DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        answerId: json["AnswerID"],
        answerTitle: json["AnswerTitle"],
        answerSubtitle: json["AnswerSubtitle"],
        questionId: json["QuestionID"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt?.toIso8601String(),
        "UpdatedAt": updatedAt?.toIso8601String(),
        "DeletedAt": deletedAt,
        "AnswerID": answerId,
        "AnswerTitle": answerTitle,
        "AnswerSubtitle": answerSubtitle,
        "QuestionID": questionId,
    };
}
