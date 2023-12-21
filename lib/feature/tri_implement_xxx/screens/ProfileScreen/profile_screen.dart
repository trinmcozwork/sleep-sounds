// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_assets.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_icons.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/ProfileScreen/favorite_screen.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/ProfileScreen/premium_screen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key, required this.isLogin});
  bool isLogin;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<bool?> _dialogBuilder(BuildContext context) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.backgroundColor,
          content: const Text(
            'Are you sure you want to log out?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0x99EBEBF5),
              fontSize: 13,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w400,
            ),
          ),
          title: const Text(
            'Log out',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.w900,
              letterSpacing: 0.15,
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'Cancel',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF0A84FF),
                  fontSize: 17,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'Logout',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF0A84FF),
                  fontSize: 17,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w600,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 60,
                margin: const EdgeInsets.only(
                  top: 44,
                ),
                child: const Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              widget.isLogin
                  ? SizedBox(
                      height: 240,
                      child: Center(
                        child: Container(
                          width: 350,
                          decoration: BoxDecoration(
                            color: AppColors.buttonColor,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(AppAssets.folder),
                              const Text(
                                "Fisrt name Last name",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                'Login with Apple ID \nemail@gmail.com',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0x99EBEBF5),
                                  fontSize: 13,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              InkWell(
                                onTap: () async {
                                  bool? result = await _dialogBuilder(context);
                                  if (result == true) {
                                    setState(() {
                                      widget.isLogin = false;
                                    });
                                  }
                                },
                                child: const Text(
                                  'Logout',
                                  style: TextStyle(
                                    color: Color(0xFFFF9C41),
                                    fontSize: 17,
                                    fontFamily: 'Nunito',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: 240,
                      child: Center(
                        child: Container(
                          width: 350,
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          decoration: BoxDecoration(
                              color: AppColors.buttonColor,
                              borderRadius: BorderRadius.circular(24)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(AppIcons.neightbor),
                              const Text(
                                "Authorization",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(
                                height: 4,
                              ),
                              const Text(
                                'In order to access the library of favorite packs \nof sounds, log in with Apple ID',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0x99EBEBF5),
                                  fontSize: 13,
                                  fontFamily: 'Nunito',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    widget.isLogin = true;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: AppColors.backgroundColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(AppAssets.apple_icon),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      const Text(
                                        'Login with Apple',
                                        style: TextStyle(
                                          color: AppColors.textPrimary,
                                          fontSize: 17,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
              Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: 0.5,
                    color: AppColors.textSecondary,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PremiumScreen(),
                        ),
                      );
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '👑 Get premium',
                          style: TextStyle(
                            color: Color(0xFFFF9C41),
                            fontSize: 17,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: AppColors.textSecondary,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: 0.5,
                    color: AppColors.textSecondary,
                  ),
                  widget.isLogin
                      ? Column(
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              height: 0.5,
                              color: AppColors.textSecondary,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const FavoriteScreen(),
                                  ),
                                );
                              },
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '⭐ Favorites',
                                    style: TextStyle(
                                      color: AppColors.textPrimary,
                                      fontSize: 17,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  Icon(
                                    Icons.keyboard_arrow_right,
                                    color: AppColors.textSecondary,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              height: 0.5,
                              color: AppColors.textSecondary,
                            ),
                          ],
                        )
                      : Container(),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: 0.5,
                    color: AppColors.textSecondary,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '📰 Private policy',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 17,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.textSecondary,
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: 0.5,
                    color: AppColors.textSecondary,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '📰 License agreement',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 17,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.textSecondary,
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: 0.5,
                    color: AppColors.textSecondary,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: 0.5,
                    color: AppColors.textSecondary,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '💟 Rate us',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 17,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.textSecondary,
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: 0.5,
                    color: AppColors.textSecondary,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '💌 Send feedback',
                        style: TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 17,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: AppColors.textSecondary,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
