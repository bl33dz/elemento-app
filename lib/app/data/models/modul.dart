// To parse this JSON data, do
//
//     final module = moduleFromJson(jsonString);

import 'dart:convert';

Module moduleFromJson(String str) => Module.fromJson(json.decode(str));

String moduleToJson(Module data) => json.encode(data.toJson());

class Module {
    int? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    String? modulId;
    String? title;
    String? subtitle;
    String? image;
    String? imageUrl;
    bool? progress;
    String? youtubeLink;
    dynamic babs;

    Module({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.modulId,
        this.title,
        this.subtitle,
        this.image,
        this.imageUrl,
        this.progress,
        this.youtubeLink,
        this.babs,
    });

    factory Module.fromJson(Map<String, dynamic> json) => Module(
        id: json["ID"],
        createdAt: json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]),
        updatedAt: json["UpdatedAt"] == null ? null : DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        modulId: json["ModulID"],
        title: json["Title"],
        subtitle: json["Subtitle"],
        image: json["Image"],
        imageUrl: json["ImageUrl"],
        progress: json["Progress"],
        youtubeLink: json["YoutubeLink"],
        babs: json["Babs"],
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
        "Progress": progress,
        "YoutubeLink": youtubeLink,
        "Babs": babs,
    };
}
