// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_assets.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/DiscoverScreens/widgets/draggable_scroll_pack.dart';

class PackDetails extends StatefulWidget {
  const PackDetails(
      {super.key, required this.index, required this.loadedSongs});
  final index;
  final loadedSongs;

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

  Widget btnStart() {
    return InkWell(
      onTap: () {
        // if (isPlaying == false) {
        //   setState(() {
        //     isPlaying = true;
        //   });
        // } else if (isPlaying == true) {
        //   setState(() {
        //     isPlaying = false;
        //   });
        // }
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
                            fontFamily: 'SF Pro Display',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 500,
                  child: Image.network(
                    widget.loadedSongs[widget.index]['img'],
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
            DraggableScrollPackDetails(
              loadedSongs: widget.loadedSongs,
              index: widget.index,
              updateIsPlaying: _updateIsPlaying,
            ),
            Positioned(
              bottom: 0,
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
                          child: Image.network(
                            widget.loadedSongs[widget.index]['img'],
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'The Guitars',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontFamily: 'SF Pro Rounded',
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              widget.loadedSongs[widget.index]['title'],
                              style: const TextStyle(
                                color: Color(0x99EBEBF5),
                                fontSize: 13,
                                fontFamily: 'SF Pro Rounded',
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
            )
          ],
        ),
      ),
    );
  }
}
