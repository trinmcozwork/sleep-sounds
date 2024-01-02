import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SoundsProvider extends ChangeNotifier {
  List _album = [];
  List get album => _album;

  List _song = [];
  List get song => _song;

  bool _isFetchingAlbum = false;
  bool _isFetchingSong = false;

  Future<List> fetchAlbumData() async {
    if (_isFetchingAlbum) {
      return _album;
    }
    try {
      _isFetchingAlbum = true;

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
    } finally {
      _isFetchingAlbum = false;
    }
  }

  Future<List> fetchSongData(int index) async {
    if (_isFetchingSong) {
      return _song;
    }
    try {
      _isFetchingSong = true;
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
    } finally {
      _isFetchingSong = false;
    }
  }

  var _indexAlbum = 0;
  get indexAlbum => _indexAlbum;

  void setIndexAlbum(int index) {
    _indexAlbum = index;
    notifyListeners();
  }

  var _indexSong = 0;
  get indexSong => _indexSong;

  void setIndexSong(int index) {
    _indexSong = index;
    notifyListeners();
  }

  var _currentAlbum = '';
  var _currentSong = '';
  var _currentImage = '';
  get currentAlbum => _currentAlbum;
  get currentSong => _currentSong;
  get currentImage => _currentImage;
  void setCurrentAlbumPlaying(
      String currentAlbum, String currentSong, String currentImage) {
    _currentAlbum = currentAlbum;
    _currentSong = currentSong;
    _currentImage = currentImage;
    notifyListeners();
  }
}
