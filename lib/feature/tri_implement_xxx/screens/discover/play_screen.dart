// ignore_for_file: prefer_typing_uninitialized_variables, file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/providers/sounds.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/discover/pack_details_screen.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/discover/widgets/audio/audio_player.dart';
import 'package:provider/provider.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({super.key, required this.loadSong});

  final loadSong;

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    final soundsProvider = Provider.of<SoundsProvider>(context);
    return Dismissible(
      background: PackDetails(),
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
                      imageUrl: soundsProvider.album[soundsProvider.indexAlbum]
                          ['img'],
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    soundsProvider.album[soundsProvider.indexAlbum]['title'],
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
                    widget.loadSong,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
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
