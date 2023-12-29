// ignore_for_file: prefer_final_fields, camel_case_types, file_names

import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/models/list_album.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  List<String> _sounds = [];
  List<String> get sounds => _sounds;

  void toggleFavorite(SoundsDetails sound) {
    final isExist = _sounds.contains(soundsDetailsToJson(sound));
    if (isExist) {
      _sounds.remove(soundsDetailsToJson(sound));
    } else {
      _sounds.add(soundsDetailsToJson(sound));
    }
    notifyListeners();
  }

  static FavoriteProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}
