
import 'dart:convert';

School schoolFromJson(String str) => School.fromJson(json.decode(str));

String schoolToJson(School data) => json.encode(data.toJson());

class School {
    int? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;
    String? schoolId;
    String? name;
    String? location;
    dynamic schoolClass;

    School({
        this.id,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.schoolId,
        this.name,
        this.location,
        this.schoolClass,
    });

    factory School.fromJson(Map<String, dynamic> json) => School(
        id: json["ID"],
        createdAt: json["CreatedAt"] == null ? null : DateTime.parse(json["CreatedAt"]),
        updatedAt: json["UpdatedAt"] == null ? null : DateTime.parse(json["UpdatedAt"]),
        deletedAt: json["DeletedAt"],
        schoolId: json["SchoolID"],
        name: json["Name"],
        location: json["Location"],
        schoolClass: json["Class"],
    );

    Map<String, dynamic> toJson() => {
        "ID": id,
        "CreatedAt": createdAt?.toIso8601String(),
        "UpdatedAt": updatedAt?.toIso8601String(),
        "DeletedAt": deletedAt,
        "SchoolID": schoolId,
        "Name": name,
        "Location": location,
        "Class": schoolClass,
    };
}
