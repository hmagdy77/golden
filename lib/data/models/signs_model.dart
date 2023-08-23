// To parse this JSON data, do
//
//     final signsModel = signsModelFromJson(jsonString);

import 'dart:convert';

SignsModel signsModelFromJson(String str) =>
    SignsModel.fromJson(json.decode(str));

String signsModelToJson(SignsModel data) => json.encode(data.toJson());

class SignsModel {
  String status;
  List<Sign> data;

  SignsModel({
    required this.status,
    required this.data,
  });

  factory SignsModel.fromJson(Map<String, dynamic> json) => SignsModel(
        status: json["status"],
        data: List<Sign>.from(json["data"].map((x) => Sign.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Sign {
  String id;
  String name;
  String gender;
  String age;
  String sug;
  String phone;
  String activty;
  String borthers;
  String signed;
  String played;
  String seen;
  DateTime time;

  Sign({
    required this.id,
    required this.name,
    required this.gender,
    required this.age,
    required this.sug,
    required this.phone,
    required this.activty,
    required this.borthers,
    required this.signed,
    required this.played,
    required this.seen,
    required this.time,
  });

  factory Sign.fromJson(Map<String, dynamic> json) => Sign(
        id: json["id"],
        name: json["name"],
        gender: json["gender"],
        age: json["age"],
        sug: json["sug"],
        phone: json["phone"],
        activty: json["activty"],
        borthers: json["borthers"],
        signed: json["signed"],
        played: json["played"],
        seen: json["seen"],
        time: DateTime.parse(json["time"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "gender": gender,
        "age": age,
        "phone": phone,
        "activty": activty,
        "borthers": borthers,
        "signed": signed,
        "played": played,
        "seen": seen,
        "time": time.toIso8601String(),
      };
}
