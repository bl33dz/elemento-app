// To parse this JSON data, do
//
//     final detailMagic = detailMagicFromJson(jsonString);

import 'dart:convert';

DetailMagic detailMagicFromJson(String str) => DetailMagic.fromJson(json.decode(str));

String detailMagicToJson(DetailMagic data) => json.encode(data.toJson());

class DetailMagic {
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    String? id;
    String? namaMolekul;
    String? unsurMolekul;
    String? image;
    String? imageUrl;
    String? description;
    String? audio;
    List<ListSenyawa>? listSenyawa;

    DetailMagic({
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.id,
        this.namaMolekul,
        this.unsurMolekul,
        this.image,
        this.imageUrl,
        this.description,
        this.audio,
        this.listSenyawa,
    });

    factory DetailMagic.fromJson(Map<String, dynamic> json) => DetailMagic(
        createdAt: json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]),
        updatedAt: json["UpdatedAt"] == null ? null : DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        id: json["ID"],
        namaMolekul: json["NamaMolekul"],
        unsurMolekul: json["UnsurMolekul"],
        image: json["Image"],
        imageUrl: json["ImageUrl"],
        description: json["Description"],
        audio: json["Audio"],
        listSenyawa: json["ListSenyawa"] == null ? [] : List<ListSenyawa>.from(json["ListSenyawa"]!.map((x) => ListSenyawa.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "CreatedAt": createdAt?.toIso8601String(),
        "UpdatedAt": updatedAt?.toIso8601String(),
        "DeletedAt": deletedAt,
        "ID": id,
        "NamaMolekul": namaMolekul,
        "UnsurMolekul": unsurMolekul,
        "Image": image,
        "ImageUrl": imageUrl,
        "Description": description,
        "Audio": audio,
        "ListSenyawa": listSenyawa == null ? [] : List<dynamic>.from(listSenyawa!.map((x) => x.toJson())),
    };
}

class ListSenyawa {
    int? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    String? judul;
    String? unsur;
    String? deskripsi;
    String? audio;
    String? magicCardId;

    ListSenyawa({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.judul,
        this.unsur,
        this.deskripsi,
        this.audio,
        this.magicCardId,
    });

    factory ListSenyawa.fromJson(Map<String, dynamic> json) => ListSenyawa(
        id: json["ID"],
        createdAt: json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]),
        updatedAt: json["UpdatedAt"] == null ? null : DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        judul: json["Judul"],
        unsur: json["Unsur"],
        deskripsi: json["Deskripsi"],
        audio: json["Audio"],
        magicCardId: json["MagicCardId"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt?.toIso8601String(),
        "UpdatedAt": updatedAt?.toIso8601String(),
        "DeletedAt": deletedAt,
        "Judul": judul,
        "Unsur": unsur,
        "Deskripsi": deskripsi,
        "Audio": audio,
        "MagicCardId": magicCardId,
    };
}
