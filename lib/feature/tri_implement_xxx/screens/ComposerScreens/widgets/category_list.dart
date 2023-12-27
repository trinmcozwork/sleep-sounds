// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'category_item.dart';

class CategoryList extends StatefulWidget {
  final List<Map<String, dynamic>> category;
  final List<int> selectedIndices;
  final Color selectedColor;

  const CategoryList({
    required this.category,
    required this.selectedIndices,
    required this.selectedColor,
    super.key,
  });

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.category.length,
        itemBuilder: (BuildContext buildContext, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                if (widget.selectedIndices.contains(index)) {
                  widget.selectedIndices.remove(index);
                } else {
                  widget.selectedIndices.add(index);
                }
              });
            },
            child: CategoryItem(
              itemData: widget.category[index],
              isSelected: widget.selectedIndices.contains(index),
              selectedColor: widget.selectedColor,
            ),
          );
        },
      ),
    );
  }
}
