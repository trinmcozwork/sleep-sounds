// To parse this JSON data, do
//
//     final listSong = listSongFromJson(jsonString);

import 'dart:convert';

List<ListSong> listSongFromJson(String str) =>
    List<ListSong>.from(json.decode(str).map((x) => ListSong.fromJson(x)));

String listSongToJson(List<ListSong> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListSong {
  String songName;
  String artist;
  String album;
  String songUrl;
  String songImg;
  String id;
  String mydataId;

  ListSong({
    required this.songName,
    required this.artist,
    required this.album,
    required this.songUrl,
    required this.songImg,
    required this.id,
    required this.mydataId,
  });

  factory ListSong.fromJson(Map<String, dynamic> json) => ListSong(
        songName: json["songName"],
        artist: json["artist"],
        album: json["album"],
        songUrl: json["songUrl"],
        songImg: json["songImg"],
        id: json["id"],
        mydataId: json["mydataId"],
      );

  Map<String, dynamic> toJson() => {
        "songName": songName,
        "artist": artist,
        "album": album,
        "songUrl": songUrl,
        "songImg": songImg,
        "id": id,
        "mydataId": mydataId,
      };
}
