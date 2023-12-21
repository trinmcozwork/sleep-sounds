// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/DiscoverScreens/widgets/audio.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen(
      {super.key,
      required this.index,
      required this.loadList,
      required this.loadSong});
  final index;
  final loadList;
  final loadSong;

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
                    widget.loadList[widget.index]['img'],
                    fit: BoxFit.fitHeight,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  widget.loadList[widget.index]['title'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  widget.loadSong['songName'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontFamily: 'Nunito',
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
