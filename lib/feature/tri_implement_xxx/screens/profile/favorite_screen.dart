// ignore_for_file: must_be_immutable, unused_local_variable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/providers/Favorite.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/profile/widgets/empty_favorites.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/profile/widgets/sound_list.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final sounds = provider.sounds;
    final uniqueSounds = sounds.toSet().toList();

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Favorites",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w900,
            letterSpacing: 0.75,
          ),
        ),
        backgroundColor: AppColors.buttonColor,
      ),
      body: uniqueSounds.isEmpty
          ? EmptyFavoritesWidget()
          : SoundList(uniqueSounds: uniqueSounds),
    );
  }
}
