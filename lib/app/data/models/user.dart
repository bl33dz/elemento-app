// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String? email;
    String? firstName;
    String? idUser;
    Kelas? kelas;
    String? lastName;
    String? role;
    School? school;

    User({
        this.email,
        this.firstName,
        this.idUser,
        this.kelas,
        this.lastName,
        this.role,
        this.school,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        email: json["email"],
        firstName: json["firstName"],
        idUser: json["idUser"],
        kelas: json["kelas"] == null ? null : Kelas.fromJson(json["kelas"]),
        lastName: json["lastName"],
        role: json["role"],
        school: json["school"] == null ? null : School.fromJson(json["school"]),
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "firstName": firstName,
        "idUser": idUser,
        "kelas": kelas?.toJson(),
        "lastName": lastName,
        "role": role,
        "school": school?.toJson(),
    };
}

class Kelas {
    String? idKelas;
    String? namaKelas;

    Kelas({
        this.idKelas,
        this.namaKelas,
    });

    factory Kelas.fromJson(Map<String, dynamic> json) => Kelas(
        idKelas: json["idKelas"],
        namaKelas: json["namaKelas"],
    );

    Map<String, dynamic> toJson() => {
        "idKelas": idKelas,
        "namaKelas": namaKelas,
    };
}

class School {
    String? idSekolah;
    String? namaSekolah;

    School({
        this.idSekolah,
        this.namaSekolah,
    });

    factory School.fromJson(Map<String, dynamic> json) => School(
        idSekolah: json["idSekolah"],
        namaSekolah: json["namaSekolah"],
    );

    Map<String, dynamic> toJson() => {
        "idSekolah": idSekolah,
        "namaSekolah": namaSekolah,
    };
}
