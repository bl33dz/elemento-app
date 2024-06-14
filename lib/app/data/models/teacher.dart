// To parse this JSON data, do
//
//     final teacher = teacherFromJson(jsonString);

import 'dart:convert';

Teacher teacherFromJson(String str) => Teacher.fromJson(json.decode(str));

String teacherToJson(Teacher data) => json.encode(data.toJson());

class Teacher {
    String? idUser;
    String? fullname;
    String? email;
    String? password;
    String? role;
    String? idKelas;
    String? idSekolah;

    Teacher({
        this.idUser,
        this.fullname,
        this.email,
        this.password,
        this.role,
        this.idKelas,
        this.idSekolah,
    });

    factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        idUser: json["id_user"],
        fullname: json["fullname"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
        idKelas: json["id_kelas"],
        idSekolah: json["id_sekolah"],
    );

    Map<String, dynamic> toJson() => {
        "id_user": idUser,
        "fullname": fullname,
        "email": email,
        "password": password,
        "role": role,
        "id_kelas": idKelas,
        "id_sekolah": idSekolah,
    };
}
