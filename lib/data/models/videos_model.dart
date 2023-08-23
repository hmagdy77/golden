// To parse this JSON data, do
//
//     final videoModel = videoModelFromJson(jsonString);

import 'dart:convert';

VideoModel videoModelFromJson(String str) => VideoModel.fromJson(json.decode(str));

String videoModelToJson(VideoModel data) => json.encode(data.toJson());

class VideoModel {
    String status;
    List<Video> data;

    VideoModel({
        required this.status,
        required this.data,
    });

    factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        status: json["status"],
        data: List<Video>.from(json["data"].map((x) => Video.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Video {
    String id;
    String url;
    DateTime time;

    Video({
        required this.id,
        required this.url,
        required this.time,
    });

    factory Video.fromJson(Map<String, dynamic> json) => Video(
        id: json["id"],
        url: json["url"],
        time: DateTime.parse(json["time"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "time": time.toIso8601String(),
    };
}
