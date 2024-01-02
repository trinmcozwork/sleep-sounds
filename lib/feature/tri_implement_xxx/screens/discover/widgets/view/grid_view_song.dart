// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/providers/sounds.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/discover/pack_details_screen.dart';
import 'package:provider/provider.dart';

class GridViewSongs extends StatelessWidget {
  const GridViewSongs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final soundsProvider = Provider.of<SoundsProvider>(context);

    return GridView.builder(
      itemCount: soundsProvider.album.length,
      itemBuilder: (BuildContext context, index) {
        return InkWell(
          onTap: () {
            soundsProvider.setIndexAlbum(index);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PackDetails(),
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
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: CachedNetworkImage(
                        imageUrl: soundsProvider.album[index]['img'],
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.systemPrimary,
                          ),
                        ),
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
                mainAxisAlignment: MainAxisAlignment.center,
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
