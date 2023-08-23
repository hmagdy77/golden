// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  String status;
  List<Post> data;

  PostModel({
    required this.status,
    required this.data,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        status: json["status"],
        data: List<Post>.from(json["data"].map((x) => Post.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Post {
  String id;
  String title;
  String header;
  String content;
  String image;
  String kind;
  DateTime start;
  DateTime end;

  Post({
    required this.id,
    required this.title,
    required this.header,
    required this.content,
    required this.image,
    required this.kind,
    required this.start,
    required this.end,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        header: json["header"],
        content: json["content"],
        image: json["image"],
        kind: json["kind"],
        start: DateTime.parse(json["start"]),
        end: DateTime.parse(json["end"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "header": header,
        "content": content,
        "image": image,
        "kind": kind,
        "start": start.toIso8601String(),
        "end": end.toIso8601String(),
      };
}
