// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_colors.dart';

class CategoryItem extends StatelessWidget {
  final Map<String, dynamic> itemData;
  final bool isSelected;
  final Color selectedColor;

  const CategoryItem({
    required this.itemData,
    required this.isSelected,
    required this.selectedColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 16,
        bottom: 16,
        right: 16,
      ),
      width: 110,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isSelected ? selectedColor : AppColors.buttonColor,
      ),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Image.asset(
              itemData['img'],
              height: 30,
              width: 30,
              color: AppColors.textPrimary,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
                color:
                    isSelected ? AppColors.buttonColor : AppColors.buttonGrey,
              ),
              child: Center(
                child: Text(
                  itemData['title'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
