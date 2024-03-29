// ignore_for_file: unused_local_variable, file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_assets.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/services/firebase/firebase_services.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/services/navigation/bottom_navigation.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/widgets/check_platform.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/start/widgets/page_view_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLogin = false;

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
                    checkPlatform(
                      Image.asset(AppAssets.google_icon),
                      Image.asset(AppAssets.apple_icon),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () async {
                        setState(() {
                          _isLogin = true;
                        });
                        await FirebaseServices().signInWithGoogle();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyBottomNavigation(_isLogin),
                          ),
                        );
                      },
                      child: Text(
                        checkPlatform('Login with Google', 'Login with Apple'),
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
