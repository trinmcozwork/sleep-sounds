// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_assets.dart';

class EmptyFavoritesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.music_heart),
          const SizedBox(height: 20),
          const Text(
            'Favorite is Empty',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w900,
              letterSpacing: 0.75,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Your favorite packs will be stored here',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0x99EBEBF5),
              fontSize: 14,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w600,
              letterSpacing: 0.10,
            ),
          ),
        ],
      ),
    );
  }
}
