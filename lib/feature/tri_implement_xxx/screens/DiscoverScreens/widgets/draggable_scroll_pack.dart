// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_assets.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_icons.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/DiscoverScreens/pack_details.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/DiscoverScreens/play_screen.dart';

class DraggableScrollPackDetails extends StatefulWidget {
  DraggableScrollPackDetails({
    super.key,
    required this.loadList,
    required this.index,
    required this.updateIsPlaying,
    required this.updateSong,
  });
  final ValueChanged<bool> updateIsPlaying;
  final ValueChanged<int> updateSong;
  var loadList;
  var index;

  @override
  State<DraggableScrollPackDetails> createState() =>
      _DraggableScrollPackDetailsState();
}

class _DraggableScrollPackDetailsState
    extends State<DraggableScrollPackDetails> {
  bool _resultValue = false;
  bool isFavorite = false;

  int resultIndex = 0;

  Future<void> _navigateAndDisplayResult(int index) async {
    bool result = await _navigateAndDisplaySelection(context, index);
    setState(() {
      _resultValue = result;
      widget.updateIsPlaying(_resultValue);
      widget.updateSong(resultIndex);
    });
  }

  Future<bool> _navigateAndDisplaySelection(BuildContext context, index) async {
    bool result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlayScreen(
          index: widget.index,
          loadList: widget.loadList,
          loadSong: widget.loadList[widget.index]['listOfSongs'][index],
        ),
      ),
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      minChildSize: 0.4,
      maxChildSize: 0.9,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Container(
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
                    widget.loadList[widget.index]['title'],
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
                        widget.loadList[widget.index]['time'],
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
                        widget.loadList[widget.index]['filter'],
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
                            _navigateAndDisplayResult(0);
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
                              if (isFavorite == false) {
                                isFavorite = true;
                              } else {
                                isFavorite = false;
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
                                  isFavorite
                                      ? AppIcons.start_half
                                      : AppIcons.start_fillted,
                                  height: 24,
                                ),
                                Text(
                                  "Favorite",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: isFavorite
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
                    widget.loadList[widget.index]['description'],
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
                            itemCount: widget
                                .loadList[widget.index]['listOfSongs'].length,
                            itemBuilder: (BuildContext buildContext, index) {
                              return InkWell(
                                onTap: () {
                                  _navigateAndDisplayResult(index);
                                  setState(() {
                                    resultIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(bottom: 20),
                                  child: Row(
                                    children: [
                                      Text(
                                        widget.loadList[index]['listOfSongs']
                                            [index]['songId'],
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
                                            color: AppColors.backgroundColor),
                                        child: Image.asset(
                                          AppAssets.play,
                                          height: 12,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        widget.loadList[index]['listOfSongs']
                                            [index]['songName'],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w400,
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
                      itemCount: widget.loadList.length,
                      itemBuilder: (BuildContext context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PackDetails(
                                  index: index,
                                  loadList: widget.loadList,
                                ),
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
                                      child: Image.network(
                                        widget.loadList[index]['img'],
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                    Positioned(
                                      top: 16,
                                      left: 8,
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
                                  widget.loadList[index]['title'],
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      widget.loadList[index]['time'],
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
                                      widget.loadList[index]['filter'],
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
          ),
        );
      },
    );
  }
}
