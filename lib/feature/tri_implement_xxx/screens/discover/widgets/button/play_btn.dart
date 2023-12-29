// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_assets.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/providers/audio_player.dart';
import 'package:provider/provider.dart';

class MusicPlayerButton extends StatelessWidget {
  const MusicPlayerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioPlayerProvider>(
      builder: (context, audioPlayerProvider, _) {
        return InkWell(
            onTap: () {
              audioPlayerProvider.togglePlayPause();
            },
            child: audioPlayerProvider.isPlaying
                ? Image.asset(AppAssets.pause, height: 25)
                : Image.asset(AppAssets.play, height: 25));
      },
    );
  }
}
