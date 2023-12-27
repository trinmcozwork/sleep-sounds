// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_assets.dart';

class RandomButton extends StatelessWidget {
  const RandomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Image.asset(
        AppAssets.random,
        height: 25,
      ),
    );
  }
}
