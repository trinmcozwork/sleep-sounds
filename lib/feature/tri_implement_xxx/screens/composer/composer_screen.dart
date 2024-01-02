// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/composer/widgets/category_list.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/widgets/composer_list.dart';

class ComposerScreen extends StatelessWidget {
  ComposerScreen({super.key});

  List<int> selectedChildIndices = [];

  List<int> selectedNatureIndices = [];

  List<int> selectedAnimalsIndices = [];

  List<int> selectedIndustrialIndices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 44,
                ),
                child: const Text(
                  'Composer',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Child",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 12,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                "Quickly stabilize your baby’s emotions",
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w400,
                ),
              ),
              CategoryList(
                category: child,
                selectedIndices: selectedChildIndices,
                selectedColor: AppColors.systemPrimary,
              ),
              const Text(
                "Nature",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 12,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                "It will allow you to merge with nature",
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w400,
                ),
              ),
              CategoryList(
                category: nature,
                selectedIndices: selectedNatureIndices,
                selectedColor: AppColors.systemGreenPrimary,
              ),
              const Text(
                "Animals",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 12,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                "Animal voices will improve your sleep",
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w400,
                ),
              ),
              CategoryList(
                category: animal,
                selectedIndices: selectedAnimalsIndices,
                selectedColor: AppColors.systemYelloPrimary,
              ),
              const Text(
                'Industrial',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              const Text(
                'Quickly stabilize your baby’s emotions',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: 12,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w400,
                ),
              ),
              CategoryList(
                category: industrial,
                selectedIndices: selectedIndustrialIndices,
                selectedColor: AppColors.systemRedPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
