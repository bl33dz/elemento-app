
import 'dart:convert';

SchoolClass schoolClassFromJson(String str) => SchoolClass.fromJson(json.decode(str));

String schoolClassToJson(SchoolClass data) => json.encode(data.toJson());

class SchoolClass {
    int? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    String? classId;
    String? name;
    String? location;

    SchoolClass({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.classId,
        this.name,
        this.location,
    });

    factory SchoolClass.fromJson(Map<String, dynamic> json) => SchoolClass(
        id: json["ID"],
        createdAt: json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]),
        updatedAt: json["UpdatedAt"] == null ? null : DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        classId: json["ClassID"],
        name: json["Name"],
        location: json["Location"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt?.toIso8601String(),
        "UpdatedAt": updatedAt?.toIso8601String(),
        "DeletedAt": deletedAt,
        "ClassID": classId,
        "Name": name,
        "Location": location,
    };
}
