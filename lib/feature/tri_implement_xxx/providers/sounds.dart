import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SoundsProvider extends ChangeNotifier {
  List _album = [];
  List get album => _album;

  List _song = [];
  List get song => _song;

  Future<List> fetchAlbumData() async {
    const apiUrl = 'https://6572aae9192318b7db407e1b.mockapi.io/mydata';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      _album = jsonResponse;
      notifyListeners();
      return _album;
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }

  Future<List> fetchSongData(int index) async {
    const rootUrl = "https://6572aae9192318b7db407e1b.mockapi.io/mydata";
    final apiUrl = '$rootUrl/${index + 1}/listOfSong';
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      _song = jsonResponse;
      notifyListeners();
      return _song;
    } else {
      throw Exception('Unexpected error occurred!');
    }
  }

  var _indexAlbum = 0;
  get indexAlbum => _indexAlbum;

  void getIndexAlbum(int index) {
    _indexAlbum = index;
    notifyListeners();
  }
}
