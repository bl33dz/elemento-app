
import 'dart:convert';

Magic magicFromJson(String str) => Magic.fromJson(json.decode(str));

String magicToJson(Magic data) => json.encode(data.toJson());

class Magic {
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    String? id;
    String? namaMolekul;
    String? unsurMolekul;
    String? image;
    String? imageUrl;
    String? description;

    Magic({
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.id,
        this.namaMolekul,
        this.unsurMolekul,
        this.image,
        this.imageUrl,
        this.description,
    });

    factory Magic.fromJson(Map<String, dynamic> json) => Magic(
        createdAt: json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]),
        updatedAt: json["UpdatedAt"] == null ? null : DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        id: json["ID"],
        namaMolekul: json["NamaMolekul"],
        unsurMolekul: json["UnsurMolekul"],
        image: json["Image"],
        imageUrl: json["ImageUrl"],
        description: json["Description"],
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
    };
}
