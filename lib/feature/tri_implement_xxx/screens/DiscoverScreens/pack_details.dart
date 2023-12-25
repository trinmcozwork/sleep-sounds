// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_assets.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_icons.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/DiscoverScreens/play_screen.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/DiscoverScreens/widgets/draggable_scroll_pack.dart';

class PackDetails extends StatefulWidget {
  PackDetails({super.key, required this.index, required this.loadList});
  final index;
  final loadList;

  @override
  State<PackDetails> createState() => _PackDetailsState();
}

class _PackDetailsState extends State<PackDetails> {
  bool isPlaying = false;
  _updateIsPlaying(bool isUpdatedPlaying) {
    setState(() {
      isPlaying = isUpdatedPlaying;
    });
  }

  int songId = 0;
  _updateSong(int isUpdatedSong) {
    setState(() {
      songId = isUpdatedSong;
    });
  }

  Widget btnStart() {
    return InkWell(
      onTap: () {
        setState(() {
          if (isPlaying) {
            isPlaying = false;
          } else {
            isPlaying = true;
          }
        });
      },
      child: isPlaying == false
          ? Image.asset(
              AppAssets.play,
              height: 20,
            )
          : Image.asset(
              AppAssets.pause,
              height: 20,
            ),
    );
  }

  Widget btnFastForward() {
    return InkWell(
      onTap: () {},
      child: Image.asset(
        AppAssets.fast_forward,
        height: 25,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                      child: Image.network(
                        widget.loadList[widget.index]['img'],
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
              loadList: widget.loadList,
              index: widget.index,
              updateIsPlaying: _updateIsPlaying,
              updateSong: _updateSong,
            ),
            Positioned(
              bottom: 0,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlayScreen(
                        index: widget.index,
                        loadList: widget.loadList,
                        loadSong: widget.loadList[widget.index]['listOfSongs']
                            [0],
                      ),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width.toDouble(),
                  height: 70,
                  color: AppColors.systemPrimary,
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
                              child: Image.network(
                                widget.loadList[widget.index]['img'],
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
                                // "aaa",
                                widget.loadList[widget.index]['listOfSongs']
                                    [songId]['songName'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                widget.loadList[widget.index]['title'],
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
                        Expanded(
                          flex: 1,
                          child: btnStart(),
                        ),
                        Expanded(
                          flex: 1,
                          child: btnFastForward(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
