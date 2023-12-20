// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/DiscoverScreens/widgets/audio.dart';
import 'package:just_audio/just_audio.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key, required this.index, required this.loadedSongs});
  final index;
  final loadedSongs;

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;

  _updateIsPlaying(bool isUpdatedPlaying) {
    setState(() {
      isPlaying = isUpdatedPlaying;
    });
  }

  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context, isPlaying);
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.textPrimary,
                    size: 32,
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                SizedBox(
                  width: 164,
                  height: 164,
                  child: Image.network(
                    widget.loadedSongs[widget.index]['img'],
                    fit: BoxFit.fitHeight,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.loadedSongs[widget.index]['title'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'SF Pro Rounded',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                const Text(
                  'The Guitars ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontFamily: 'SF Pro Rounded',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                AudioFile(
                  audioPlayer: audioPlayer,
                  updateIsPlaying: _updateIsPlaying,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
