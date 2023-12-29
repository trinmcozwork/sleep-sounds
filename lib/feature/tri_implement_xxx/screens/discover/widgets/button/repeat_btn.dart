// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_assets.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/providers/audio_player.dart';
import 'package:provider/provider.dart';

class RepeatButton extends StatelessWidget {
  const RepeatButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioPlayerProvider>(
        builder: (context, audioPlayerProvider, _) {
      return InkWell(
          onTap: () {
            audioPlayerProvider.toggleRepeat();
          },
          child: audioPlayerProvider.isRepeat
              ? Image.asset(
                  AppAssets.repeat,
                  height: 25,
                  color: AppColors.systemPrimary,
                )
              : Image.asset(AppAssets.repeat, height: 25));
    });
  }
}
