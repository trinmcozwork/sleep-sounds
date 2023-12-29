// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_icons.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/composer/composer_screen.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/profile/profile_screen.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/discover/sleep_screen.dart';

class MyBottomNavigation extends StatefulWidget {
  MyBottomNavigation(this.isLogin, {super.key});
  bool isLogin;

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  late int pageIndex;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pageIndex = 0;
    pages = [
      const SleepScreen(),
      const ComposerScreen(),
      ProfileScreen(isLogin: widget.isLogin),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }

  buildBottomNavigationBar(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Container(
        color: AppColors.buttonColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(
                    () {
                      pageIndex = 0;
                    },
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppIcons.discover,
                      color: pageIndex == 0
                          ? AppColors.systemPrimary
                          : AppColors.textSecondary,
                    ),
                    Text(
                      'Discover',
                      style: TextStyle(
                        color: pageIndex == 0
                            ? AppColors.systemPrimary
                            : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(
                    () {
                      pageIndex = 1;
                    },
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppIcons.composer,
                      color: pageIndex == 1
                          ? AppColors.systemPrimary
                          : AppColors.textSecondary,
                    ),
                    Text(
                      'Composer',
                      style: TextStyle(
                        color: pageIndex == 1
                            ? AppColors.systemPrimary
                            : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  setState(
                    () {
                      pageIndex = 2;
                    },
                  );
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppIcons.profile,
                      color: pageIndex == 2
                          ? AppColors.systemPrimary
                          : AppColors.textSecondary,
                    ),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: pageIndex == 2
                            ? AppColors.systemPrimary
                            : AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
