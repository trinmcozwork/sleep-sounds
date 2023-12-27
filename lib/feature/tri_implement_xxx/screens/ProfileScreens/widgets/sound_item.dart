// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/models/sounds.dart';

class SoundItem extends StatelessWidget {
  final SoundsDetails sound;

  const SoundItem({required this.sound});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              width: 140,
              height: 140,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.network(
                  sound.img,
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
        const SizedBox(height: 8),
        Text(
          sound.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 17,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              sound.time,
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
              sound.filter,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
