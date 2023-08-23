// To parse this JSON data, do
//
//     final imageModelClass = imageModelClassFromJson(jsonString);

import 'dart:convert';

ImageModelClass imageModelClassFromJson(String str) =>
    ImageModelClass.fromJson(json.decode(str));

String imageModelClassToJson(ImageModelClass data) =>
    json.encode(data.toJson());

class ImageModelClass {
  String status;
  List<ImageModelItem> data;

  ImageModelClass({
    required this.status,
    required this.data,
  });

  factory ImageModelClass.fromJson(Map<String, dynamic> json) =>
      ImageModelClass(
        status: json["status"],
        data: List<ImageModelItem>.from(
            json["data"].map((x) => ImageModelItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class ImageModelItem {
  String id;
  String name;
  String kind;
  DateTime time;

  ImageModelItem({
    required this.id,
    required this.name,
    required this.kind,
    required this.time,
  });

  factory ImageModelItem.fromJson(Map<String, dynamic> json) => ImageModelItem(
        id: json["id"],
        name: json["name"],
        kind: json["kind"],
        time: DateTime.parse(json["time"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "kind": kind,
        "time": time.toIso8601String(),
      };
}
