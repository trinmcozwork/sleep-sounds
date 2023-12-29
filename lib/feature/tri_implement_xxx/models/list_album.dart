// To parse this JSON data, do
//
//     final soundsDetails = soundsDetailsFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

SoundsDetails soundsDetailsFromJson(String str) =>
    SoundsDetails.fromJson(json.decode(str));

String soundsDetailsToJson(SoundsDetails data) => json.encode(data.toJson());

class SoundsDetails {
  String title;
  String time;
  String filter;
  bool isFavorite = false;
  String description;

  String img;
  String id;

  SoundsDetails({
    required this.title,
    required this.time,
    required this.filter,
    required this.isFavorite,
    required this.description,
    required this.img,
    required this.id,
  });

  factory SoundsDetails.fromJson(Map<String, dynamic> json) => SoundsDetails(
        title: json["title"],
        time: json["time"],
        filter: json["filter"],
        isFavorite: json["isFavorite"],
        description: json["description"],
        img: json["img"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "time": time,
        "filter": filter,
        "isFavorite": isFavorite,
        "description": description,
        "img": img,
        "id": id,
      };
}
