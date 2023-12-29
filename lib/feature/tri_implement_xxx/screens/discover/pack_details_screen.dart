// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_icons.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/providers/sounds.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/discover/play_screen.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/discover/widgets/view/draggable_scroll_pack.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/discover/widgets/button/fast_forward_btn.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/discover/widgets/button/play_btn.dart';
import 'package:provider/provider.dart';

class PackDetails extends StatefulWidget {
  PackDetails({super.key});

  @override
  State<PackDetails> createState() => _PackDetailsState();
}

class _PackDetailsState extends State<PackDetails> {
  String nameOfSongIsPlaying = '';
  _updateSong(String isUpdatedSong) {
    setState(() {
      nameOfSongIsPlaying = isUpdatedSong;
    });
  }

  @override
  Widget build(BuildContext context) {
    final soundsProvider = Provider.of<SoundsProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 16,
                    left: 8,
                    bottom: 16,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.keyboard_arrow_left,
                          color: AppColors.systemPrimary,
                        ),
                        Text(
                          'Sleep',
                          style: TextStyle(
                            color: AppColors.systemPrimary,
                            fontSize: 17,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Stack(
                  children: [
                    SizedBox(
                      height: 500,
                      child: CachedNetworkImage(
                        imageUrl: soundsProvider
                            .album[soundsProvider.indexAlbum]['img'],
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Positioned(
                      top: 200,
                      left: 0,
                      right: 0,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 41),
                        height: 90,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Image.asset(AppIcons.sleeping),
                                const Text(
                                  'Mood',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Text(
                                  'Lighthearted',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset(AppIcons.sleep),
                                const Text(
                                  'Dreams',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Text(
                                  'Daydreams',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            DraggableScrollPackDetails(
              updateSong: _updateSong,
            ),
            nameOfSongIsPlaying == ""
                ? Container()
                : Positioned(
                    bottom: 0,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlayScreen(
                              loadSong: nameOfSongIsPlaying,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width.toDouble(),
                        height: 70,
                        decoration: const BoxDecoration(
                          color: AppColors.systemPrimary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 16),
                                  height: 60,
                                  width: 60,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: CachedNetworkImage(
                                      imageUrl: soundsProvider
                                              .album[soundsProvider.indexAlbum]
                                          ['img'],
                                      fit: BoxFit.fitHeight,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      nameOfSongIsPlaying,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w400,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      soundsProvider
                                              .album[soundsProvider.indexAlbum]
                                          ['title'],
                                      style: const TextStyle(
                                        color: Color(0x99EBEBF5),
                                        fontSize: 13,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const Expanded(
                                flex: 1,
                                child: MusicPlayerButton(),
                              ),
                              const Expanded(
                                flex: 1,
                                child: FastForwardButton(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
