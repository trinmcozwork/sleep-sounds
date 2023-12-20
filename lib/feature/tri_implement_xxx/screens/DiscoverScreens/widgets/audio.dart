// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_assets.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_colors.dart';
import 'package:just_audio/just_audio.dart';

class AudioFile extends StatefulWidget {
  const AudioFile(
      {super.key, required this.audioPlayer, required this.updateIsPlaying});
  final AudioPlayer audioPlayer;
  final ValueChanged<bool> updateIsPlaying;

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  Duration duration = const Duration();
  Duration position = const Duration();
  bool isPlaying = false;
  bool isPause = false;
  bool isLoop = false;
  final source = "assets/audio/sample-15s.wav";

  Widget btnStart() {
    return InkWell(
      onTap: () async {
        if (isPlaying == false) {
          setState(() {
            isPlaying = true;
            widget.updateIsPlaying(isPlaying);
          });
        } else if (isPlaying == true) {
          setState(() {
            isPlaying = false;
            widget.updateIsPlaying(isPlaying);
          });
        }
      },
      child: isPlaying == false
          ? Image.asset(AppAssets.play)
          : Image.asset(AppAssets.pause),
    );
  }

  Widget btnFastForward() {
    return InkWell(
      onTap: () {},
      child: Image.asset(AppAssets.fast_forward),
    );
  }

  Widget btnReviewForward() {
    return InkWell(
      onTap: () {},
      child: Transform.flip(
        flipX: true,
        child: Image.asset(
          AppAssets.fast_forward,
        ),
      ),
    );
  }

  Widget slider() {
    return Slider(
      activeColor: AppColors.systemPrimary,
      inactiveColor: AppColors.textSecondary,
      value: position.inSeconds.toDouble(),
      min: 0.0,
      max: duration.inSeconds.toDouble(),
      onChanged: (double value) {
        setState(() {});
      },
    );
  }

  Widget loadAsset() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        btnReviewForward(),
        btnStart(),
        btnFastForward(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        slider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                position.toString().split('.')[0],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'SF Pro Rounded',
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                duration.toString().split('.')[0],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontFamily: 'SF Pro Rounded',
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        loadAsset(),
      ],
    );
  }
}
