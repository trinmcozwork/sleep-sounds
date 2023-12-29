// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, file_names

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/providers/audio_player.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/discover/widgets/button/repeat_btn.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/discover/widgets/button/fast_forward_btn.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/discover/widgets/button/play_btn.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/discover/widgets/button/random_btn.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/discover/widgets/button/slow_forward_btn.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/discover/widgets/button/slider.dart';
import 'package:provider/provider.dart';

class AudioFile extends StatefulWidget {
  const AudioFile({super.key});

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  bool isPause = false;
  bool isRepeat = false;

  Widget loadAsset() {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RepeatButton(),
        SlowForwardButton(),
        MusicPlayerButton(),
        FastForwardButton(),
        RandomButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SliderCustom(),
        Consumer<AudioPlayerProvider>(
          builder: (context, audioPlayerProvider, _) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    audioPlayerProvider
                        .getPosition()
                        .toString()
                        .split('.')[0]
                        .substring(2),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    audioPlayerProvider
                        .getDuration()
                        .toString()
                        .split('.')[0]
                        .substring(2),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            );
          },
        ),
        const SizedBox(
          height: 24,
        ),
        loadAsset(),
      ],
    );
  }
}
