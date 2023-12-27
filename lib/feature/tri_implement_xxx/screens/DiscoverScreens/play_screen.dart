// ignore_for_file: prefer_typing_uninitialized_variables, file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/DiscoverScreens/pack_details_screen.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/DiscoverScreens/widgets/audio_player.dart';

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
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      background: PackDetails(index: widget.index, loadList: widget.loadList),
      key: const Key("playScreen"),
      direction: DismissDirection.down,
      onDismissed: (direction) {
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
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
                    child: CachedNetworkImage(
                      imageUrl: widget.loadList[widget.index]['img'],
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
                  const AudioFile(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
