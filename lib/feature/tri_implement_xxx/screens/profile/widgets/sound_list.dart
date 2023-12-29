// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/models/list_album.dart';

import 'sound_item.dart';

class SoundList extends StatelessWidget {
  final List<String> uniqueSounds;

  const SoundList({required this.uniqueSounds});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      child: GridView.builder(
        itemCount: uniqueSounds.length,
        itemBuilder: (context, index) {
          final sound = soundsDetailsFromJson(uniqueSounds[index]);
          return SoundItem(sound: sound);
        },
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      ),
    );
  }
}
