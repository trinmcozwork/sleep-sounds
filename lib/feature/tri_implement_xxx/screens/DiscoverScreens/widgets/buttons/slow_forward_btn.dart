// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_assets.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/providers/audio_player.dart';
import 'package:provider/provider.dart';

class SlowForwardButton extends StatelessWidget {
  const SlowForwardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AudioPlayerProvider>(
        builder: (context, audioPlayerProvider, _) {
      return InkWell(
        onTap: () {
          audioPlayerProvider.toggleSlowForward();
        },
        child: Transform.flip(
          flipX: true,
          child: Image.asset(
            AppAssets.fast_forward,
            height: 25,
          ),
        ),
      );
    });
  }
}
