// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_assets.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/services/router/bottom_navigation.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/widgets/page_view_login.dart';
import 'dart:io' show Platform;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLogin = false;

  _checkPlatform(androidView, iosView) {
    if (Platform.isAndroid) {
      return androidView;
    } else if (Platform.isIOS) {
      return iosView;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                flex: 7,
                child: PageViewLogin(),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _checkPlatform(
                      Image.asset(AppAssets.google_icon),
                      Image.asset(AppAssets.apple_icon),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isLogin = true;
                        });
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyBottomNavigation(_isLogin),
                          ),
                        );
                      },
                      child: Text(
                        _checkPlatform('Login with Google', 'Login with Apple'),
                        style: const TextStyle(
                          color: AppColors.textPrimary,
                          fontSize: 17,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
