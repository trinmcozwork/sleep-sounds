import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_assets.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/StartScreens/login_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            );
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(AppAssets.app_icon),
                const SizedBox(
                  height: 36,
                ),
                const Text(
                  'Sleep Sounds ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontFamily: 'SF Pro Rounded',
                    fontWeight: FontWeight.w700,
                    height: 0.04,
                  ),
                ),
                const SizedBox(
                  height: 167,
                ),
                Image.asset(
                  AppAssets.created_by,
                  scale: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Created by',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 12,
                    fontFamily: 'SF Pro Rounded',
                    fontWeight: FontWeight.w500,
                    height: 0.12,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Designluch",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 17,
                    fontFamily: 'SF Pro Rounded',
                    fontWeight: FontWeight.w600,
                    height: 0.08,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
