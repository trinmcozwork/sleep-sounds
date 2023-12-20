// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_assets.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_colors.dart';

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
  bool isRepeat = false;
  final path = "sounds/Faded.mp3";

  @override
  void initState() {
    super.initState();
    widget.audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });
    widget.audioPlayer.onPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
    widget.audioPlayer.setSource(AssetSource(path));
    widget.audioPlayer.onPlayerComplete.listen((event) {
      position = const Duration(seconds: 0);
      if (isRepeat == true) {
        isPlaying = true;
      } else {
        isPlaying = false;
        isRepeat = false;
      }
    });
  }

  Widget btnStart() {
    return InkWell(
      onTap: () async {
        if (isPlaying == false) {
          widget.audioPlayer.play(AssetSource(path));
          setState(() {
            isPlaying = true;
            widget.updateIsPlaying(isPlaying);
          });
        } else if (isPlaying == true) {
          widget.audioPlayer.pause();
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
      onTap: () {
        widget.audioPlayer.setPlaybackRate(1.5);
      },
      child: Image.asset(AppAssets.fast_forward),
    );
  }

  Widget btnReviewForward() {
    return InkWell(
      onTap: () {
        widget.audioPlayer.setPlaybackRate(0.5);
      },
      child: Transform.flip(
        flipX: true,
        child: Image.asset(
          AppAssets.fast_forward,
        ),
      ),
    );
  }

  Widget btnRepeat() {
    return InkWell(
      onTap: () {
        if (isRepeat == false) {
          widget.audioPlayer.setReleaseMode(ReleaseMode.loop);
          setState(() {
            isRepeat = true;
          });
        } else if (isRepeat == true) {
          widget.audioPlayer.setReleaseMode(ReleaseMode.release);
          setState(() {
            isRepeat = false;
          });
        }
      },
      child: Image.asset(
        AppAssets.repeat,
        height: 32,
        color:
            isRepeat == true ? AppColors.systemPrimary : AppColors.textPrimary,
      ),
    );
  }

  Widget btnRandom() {
    return InkWell(
      onTap: () {},
      child: Image.asset(
        AppAssets.random,
        height: 32,
      ),
    );
  }

  Widget slider() {
    return Slider(
      activeColor: AppColors.systemPrimary,
      inactiveColor: AppColors.textSecondary,
      value: position.inSeconds.toDouble(),
      min: 0.0,
      max: duration.inSeconds.toDouble() + 1,
      onChanged: (double value) {
        setState(() {
          changeToSecond(value.toInt());
        });
      },
    );
  }

  void changeToSecond(int seconds) {
    Duration newDuration = Duration(seconds: seconds);
    widget.audioPlayer.seek(newDuration);
  }

  Widget loadAsset() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        btnRepeat(),
        btnReviewForward(),
        btnStart(),
        btnFastForward(),
        btnRandom(),
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
