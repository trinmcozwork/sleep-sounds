import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/providers/audio_player.dart';
import 'package:provider/provider.dart';

class SliderCustom extends StatelessWidget {
  const SliderCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioPlayerProvider>(
      builder: (context, audioPlayerProvider, _) {
        return Slider(
          activeColor: AppColors.systemPrimary,
          inactiveColor: AppColors.textSecondary,
          value: audioPlayerProvider.getPosition().inSeconds.toDouble(),
          min: 0.0,
          max: audioPlayerProvider.getDuration().inSeconds.toDouble(),
          onChanged: (double value) {
            audioPlayerProvider.changeToSecond(value.toInt());
          },
        );
      },
    );
  }
}
