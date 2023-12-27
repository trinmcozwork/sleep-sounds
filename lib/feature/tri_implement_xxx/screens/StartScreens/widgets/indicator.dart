import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_colors.dart';

class Indicator extends StatelessWidget {
  final bool isActive;
  const Indicator({
    super.key,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      width: isActive ? 16 : 8,
      height: 8,
      decoration: BoxDecoration(
          color: isActive ? AppColors.systemPrimary : AppColors.textSecondary,
          borderRadius: BorderRadius.circular(8)),
    );
  }
}
