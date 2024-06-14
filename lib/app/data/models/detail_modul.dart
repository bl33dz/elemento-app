
import 'dart:convert';

DetailModule detailModuleFromJson(String str) => DetailModule.fromJson(json.decode(str));

String detailModuleToJson(DetailModule data) => json.encode(data.toJson());

class DetailModule {
    int? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    String? modulId;
    String? title;
    String? subtitle;
    String? image;
    String? imageUrl;
    String? youtubeLink;
    List<Bab>? babs;

    DetailModule({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.modulId,
        this.title,
        this.subtitle,
        this.image,
        this.imageUrl,
        this.youtubeLink,
        this.babs,
    });

    factory DetailModule.fromJson(Map<String, dynamic> json) => DetailModule(
        id: json["ID"],
        createdAt: json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]),
        updatedAt: json["UpdatedAt"] == null ? null : DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        modulId: json["ModulID"],
        title: json["Title"],
        subtitle: json["Subtitle"],
        image: json["Image"],
        imageUrl: json["ImageUrl"],
        youtubeLink: json["YoutubeLink"],
        babs: json["Babs"] == null ? [] : List<Bab>.from(json["Babs"]!.map((x) => Bab.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt?.toIso8601String(),
        "UpdatedAt": updatedAt?.toIso8601String(),
        "DeletedAt": deletedAt,
        "ModulID": modulId,
        "Title": title,
        "Subtitle": subtitle,
        "Image": image,
        "ImageUrl": imageUrl,
        "YoutubeLink": youtubeLink,
        "Babs": babs == null ? [] : List<dynamic>.from(babs!.map((x) => x.toJson())),
    };
}

class Bab {
    int? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    String? titleId;
    String? title;
    String? description;
    String? task;
    String? resultStudent;

    Bab({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.titleId,
        this.title,
        this.description,
        this.task,
        this.resultStudent,
    });

    factory Bab.fromJson(Map<String, dynamic> json) => Bab(
        id: json["ID"],
        createdAt: json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]),
        updatedAt: json["UpdatedAt"] == null ? null : DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        titleId: json["TitleID"],
        title: json["Title"],
        description: json["Description"],
        task: json["Task"],
        resultStudent: json["ResultStudent"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt?.toIso8601String(),
        "UpdatedAt": updatedAt?.toIso8601String(),
        "DeletedAt": deletedAt,
        "TitleID": titleId,
        "Title": title,
        "Description": description,
        "Task": task,
        "ResultStudent": resultStudent,
    };
}
