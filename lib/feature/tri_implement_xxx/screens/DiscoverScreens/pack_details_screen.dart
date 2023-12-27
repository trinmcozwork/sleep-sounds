// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_icons.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/DiscoverScreens/play_screen.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/DiscoverScreens/widgets/draggable_scroll_pack.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/DiscoverScreens/widgets/buttons/fast_forward_btn.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/DiscoverScreens/widgets/buttons/play_btn.dart';

class PackDetails extends StatefulWidget {
  PackDetails({super.key, required this.index, required this.loadList});
  final index;
  final loadList;

  @override
  State<PackDetails> createState() => _PackDetailsState();
}

class _PackDetailsState extends State<PackDetails> {
  int songId = 0;
  _updateSong(int isUpdatedSong) {
    setState(() {
      songId = isUpdatedSong;
    });
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
                      child: CachedNetworkImage(
                        imageUrl: widget.loadList[widget.index]['img'],
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
                                imageUrl: widget.loadList[widget.index]['img'],
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
            )
          ],
        ),
      ),
    );
  }
}
