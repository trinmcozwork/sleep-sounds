// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_icons.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/discover/widgets/view/builder_grid_view.dart';

class SleepScreen extends StatelessWidget {
  const SleepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                top: 44,
                left: 16,
              ),
              child: const Text(
                'Discover',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: AppColors.systemPrimary,
                    ),
                    child: Row(
                      children: [
                        Image.asset(AppIcons.keypad),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(
                          'All',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: AppColors.buttonColor,
                    ),
                    child: Row(
                      children: [
                        Image.asset(AppIcons.meditation),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(
                          'Ambient',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(19),
                      color: AppColors.buttonColor,
                    ),
                    child: Row(
                      children: [
                        Image.asset(AppIcons.infant),
                        const SizedBox(
                          width: 4,
                        ),
                        const Text(
                          'Intrusmental',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 5,
            child: BuilderGridView(),
          ),
        ],
      ),
    );
  }
}
