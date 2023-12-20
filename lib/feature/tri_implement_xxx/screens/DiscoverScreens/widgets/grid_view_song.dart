import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/DiscoverScreens/pack_details.dart';

class GridViewSongs extends StatelessWidget {
  const GridViewSongs({
    super.key,
    required this.loadedSongs,
  });

  final List loadedSongs;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: loadedSongs.length,
      itemBuilder: (BuildContext context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PackDetails(
                  index: index,
                  loadedSongs: loadedSongs,
                ),
              ),
            );
          },
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 140,
                    height: 140,
                    child: Image.network(
                      loadedSongs[index]['img'],
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
                                decoration: const ShapeDecoration(
                                  color: AppColors.backgroundColor,
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
                loadedSongs[index]['title'],
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'SF Pro Rounded',
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
                    loadedSongs[index]['time'],
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                      fontFamily: 'SF Pro Rounded',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    ' 💠 ',
                    style: TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                      fontFamily: 'SF Pro Rounded',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    loadedSongs[index]['filter'],
                    style: const TextStyle(
                      color: AppColors.textSecondary,
                      fontSize: 13,
                      fontFamily: 'SF Pro Rounded',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
            ],
          ),
        );
      },
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    );
  }
}
