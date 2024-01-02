import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_assets.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/providers/audio_player.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/providers/sounds.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/discover/play_screen.dart';
import 'package:provider/provider.dart';

class ListOfSong extends StatelessWidget {
  const ListOfSong({
    super.key,
    required this.playlistUrl,
  });

  final List playlistUrl;

  @override
  Widget build(BuildContext context) {
    final soundsProvider = Provider.of<SoundsProvider>(context);
    final audioProvider = Provider.of<AudioPlayerProvider>(context);

    return Container(
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
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    audioProvider.setPlaylistUrl(playlistUrl);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PlayScreen(),
                      ),
                    );
                    audioProvider.setCurrentTrackIndex(index);
                    soundsProvider.setIndexSong(index);
                    soundsProvider.setCurrentAlbumPlaying(
                        soundsProvider.album[soundsProvider.indexAlbum]
                            ['title'],
                        soundsProvider.song[index]['songName'],
                        soundsProvider.album[soundsProvider.indexAlbum]['img']);
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
                              borderRadius: BorderRadius.circular(90),
                              color: AppColors.backgroundColor),
                          child: Image.asset(
                            AppAssets.play,
                            height: 12,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            soundsProvider.song[index]['songName'],
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
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
    );
  }
}
