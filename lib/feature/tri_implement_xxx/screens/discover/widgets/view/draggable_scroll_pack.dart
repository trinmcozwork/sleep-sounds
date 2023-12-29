// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable, file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_assets.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_icons.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/models/list_album.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/providers/Favorite.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/providers/audio_player.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/providers/sounds.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/discover/pack_details_screen.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/discover/play_screen.dart';
import 'package:provider/provider.dart';

class DraggableScrollPackDetails extends StatefulWidget {
  const DraggableScrollPackDetails({
    super.key,
    required this.updateSong,
  });
  final ValueChanged<String> updateSong;

  @override
  State<DraggableScrollPackDetails> createState() =>
      _DraggableScrollPackDetailsState();
}

class _DraggableScrollPackDetailsState
    extends State<DraggableScrollPackDetails> {
  bool _isToggle = false;
  String resultString = '';

  Future<void> _navigateAndDisplaySelection(
      BuildContext context, String value) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlayScreen(
          loadSong: resultString == '' ? value : resultString,
        ),
      ),
    );
    setState(() {
      widget.updateSong(resultString);
    });
  }

  List playlistUrl = [];

  @override
  Widget build(BuildContext context) {
    final soundsProvider = Provider.of<SoundsProvider>(context);
    final audioProvider = Provider.of<AudioPlayerProvider>(context);

    final favoriteProvider =
        Provider.of<FavoriteProvider>(context, listen: true);
    final uniqueSounds = FavoriteProvider.of(context).sounds.toSet().toList();
    setState(() {
      RegExp regex = RegExp('"id":"${soundsProvider.indexAlbum + 1}"');
      if (regex.hasMatch(uniqueSounds.toString())) {
        _isToggle = true;
      } else if (uniqueSounds.isEmpty) {
        _isToggle = false;
      }
    });
    return DraggableScrollableSheet(
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: FutureBuilder<List>(
            future: soundsProvider.fetchSongData(soundsProvider.indexAlbum),
            builder: (context, snapshot) {
              if (soundsProvider.song.isNotEmpty) {
                playlistUrl =
                    soundsProvider.song.map((item) => item['songUrl']).toList();
              }

              return Container(
                decoration: const BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          height: 4,
                          width: 32,
                          decoration: BoxDecoration(
                            color: AppColors.textSecondary,
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                      Text(
                        soundsProvider.album[soundsProvider.indexAlbum]
                            ['title'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Text(
                            soundsProvider.album[soundsProvider.indexAlbum]
                                ['time'],
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 13,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Text(
                            ' 💠 ',
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 13,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            soundsProvider.album[soundsProvider.indexAlbum]
                                ['filter'],
                            style: const TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: 13,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 0.2,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                _navigateAndDisplaySelection(context,
                                    soundsProvider.song[0]['songName']);

                                audioProvider.getPlaylistUrl(playlistUrl);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.systemPrimary,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppAssets.play,
                                      height: 24,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    const Text(
                                      "Play",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  if (_isToggle == false) {
                                    favoriteProvider.toggleFavorite(
                                      SoundsDetails.fromJson(soundsProvider
                                          .album[soundsProvider.indexAlbum]),
                                    );
                                  } else {
                                    favoriteProvider.toggleFavorite(
                                      SoundsDetails.fromJson(soundsProvider
                                          .album[soundsProvider.indexAlbum]),
                                    );
                                  }
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: AppColors.buttonColor,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      _isToggle
                                          ? AppIcons.start_half
                                          : AppIcons.start_fillted,
                                      height: 24,
                                    ),
                                    Text(
                                      "Favorite",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: _isToggle
                                            ? const Color(0xFFFF9C41)
                                            : Colors.white,
                                        fontSize: 24,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
                        height: 0.2,
                        color: AppColors.textSecondary,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        'About this pack',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        soundsProvider.album[soundsProvider.indexAlbum]
                            ['description'],
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 17,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: AppColors.buttonColor,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'LIST OF SONGS',
                              style: TextStyle(
                                color: AppColors.textSecondary,
                                fontSize: 18,
                                fontFamily: 'Nunito',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            SizedBox(
                              height: 150,
                              child: ListView.builder(
                                itemCount: soundsProvider.song.length,
                                itemBuilder: (buildContext, index) {
                                  return InkWell(
                                    onTap: () {
                                      _navigateAndDisplaySelection(
                                          context,
                                          soundsProvider.song[index]
                                              ['songName']);
                                      setState(() {
                                        resultString = soundsProvider
                                            .song[index]['songName'];
                                      });
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.only(bottom: 20),
                                      child: Row(
                                        children: [
                                          Text(
                                            index.toString(),
                                            style: const TextStyle(
                                              color: AppColors.textSecondary,
                                              fontSize: 18,
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(90),
                                                color:
                                                    AppColors.backgroundColor),
                                            child: Image.asset(
                                              AppAssets.play,
                                              height: 12,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            soundsProvider.song[index]
                                                ['songName'],
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontFamily: 'Nunito',
                                              fontWeight: FontWeight.w400,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Container(
                                            height: 0.5,
                                            color: AppColors.textSecondary,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Featured On',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: soundsProvider.album.length,
                          itemBuilder: (BuildContext context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PackDetails(),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 16),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        SizedBox(
                                          width: 140,
                                          height: 140,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            child: CachedNetworkImage(
                                              imageUrl: soundsProvider
                                                  .album[index]['img'],
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 16,
                                          right: 8,
                                          child: SizedBox(
                                            height: 32,
                                            width: 32,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  left: 0,
                                                  top: 0,
                                                  child: Opacity(
                                                    opacity: 0.72,
                                                    child: Container(
                                                      width: 32,
                                                      height: 32,
                                                      decoration:
                                                          const ShapeDecoration(
                                                        color: AppColors
                                                            .backgroundColor,
                                                        shape: OvalBorder(),
                                                      ),
                                                      child: const Icon(
                                                        Icons.play_arrow,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      soundsProvider.album[index]['title'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          soundsProvider.album[index]['time'],
                                          style: const TextStyle(
                                            color: AppColors.textSecondary,
                                            fontSize: 13,
                                            fontFamily: 'Nunito',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        const Text(
                                          ' 💠 ',
                                          style: TextStyle(
                                            color: AppColors.textSecondary,
                                            fontSize: 13,
                                            fontFamily: 'Nunito',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          soundsProvider.album[index]['filter'],
                                          style: const TextStyle(
                                            color: AppColors.textSecondary,
                                            fontSize: 13,
                                            fontFamily: 'Nunito',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
