// To parse this JSON data, do
//
//     final soundsDetails = soundsDetailsFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

SoundsDetails soundsDetailsFromJson(String str) =>
    SoundsDetails.fromJson(json.decode(str));

String soundsDetailsToJson(SoundsDetails data) => json.encode(data.toJson());

class SoundsDetails {
  final String title;
  final String time;
  final String filter;
  bool isFavorite = false;
  final String description;
  final List<ListOfSong> listOfSongs;
  final String img;
  final String id;

  SoundsDetails({
    required this.title,
    required this.time,
    required this.filter,
    required this.isFavorite,
    required this.description,
    required this.listOfSongs,
    required this.img,
    required this.id,
  });

  factory SoundsDetails.fromJson(Map<String, dynamic> json) => SoundsDetails(
        title: json["title"],
        time: json["time"],
        filter: json["filter"],
        isFavorite: json["isFavorite"],
        description: json["description"],
        listOfSongs: List<ListOfSong>.from(
            json["listOfSongs"].map((x) => ListOfSong.fromJson(x))),
        img: json["img"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "time": time,
        "filter": filter,
        "isFavorite": isFavorite,
        "description": description,
        "listOfSongs": List<dynamic>.from(listOfSongs.map((x) => x.toJson())),
        "img": img,
        "id": id,
      };
}

class ListOfSong {
  String songId;
  String songName;

  ListOfSong({
    required this.songId,
    required this.songName,
  });

  factory ListOfSong.fromJson(Map<String, dynamic> json) => ListOfSong(
        songId: json["songId"],
        songName: json["songName"],
      );

  Map<String, dynamic> toJson() => {
        "songId": songId,
        "songName": songName,
      };
}
