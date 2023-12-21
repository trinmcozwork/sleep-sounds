import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_assets.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_colors.dart';

final List child = [
  {"img": AppAssets.female_voice, "title": "Female voice"},
  {"img": AppAssets.ultrasound, "title": "White voice"},
  {"img": AppAssets.lullaby, "title": "Lullaby"},
];
final List nature = [
  {"img": AppAssets.rain, "title": "Rain"},
  {"img": AppAssets.forest, "title": "Forest"},
  {"img": AppAssets.wave, "title": "Ocean"},
  {"img": AppAssets.musical, "title": "Music"},
];
final List animal = [
  {"img": AppAssets.bird, "title": "Bird"},
  {"img": AppAssets.cat, "title": "Cat"},
  {"img": AppAssets.frog, "title": "Frog"},
];
final List industrial = [
  {"img": AppAssets.train, "title": "Train"},
  {"img": AppAssets.airplane, "title": "Aircraft"},
  {"img": AppAssets.city, "title": "City"},
  {"img": AppAssets.coffee, "title": "Caffe"},
];

class ComposerScreen extends StatefulWidget {
  const ComposerScreen({super.key});

  @override
  State<ComposerScreen> createState() => _ComposerScreenState();
}

class _ComposerScreenState extends State<ComposerScreen> {
  int selectedChildIndex = -1;
  int selectedNatureIndex = -1;
  int selectedAnimalsIndex = -1;
  int selectedIndustrialIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                  height: 32,
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
                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: child.length,
                    itemBuilder: (BuildContext buildContext, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedChildIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: 16,
                            bottom: 16,
                            right: 16,
                          ),
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: index == selectedChildIndex
                                ? AppColors.systemPrimary
                                : AppColors.buttonColor,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Image.asset(child[index]['img']),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  child[index]['title'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontFamily: 'SF Compact Rounded',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
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
                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: nature.length,
                    itemBuilder: (BuildContext buildContext, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedNatureIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: 16,
                            bottom: 16,
                            right: 16,
                          ),
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: index == selectedNatureIndex
                                ? const Color(0xFF00D971)
                                : AppColors.buttonColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Image.asset(nature[index]['img']),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  nature[index]['title'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontFamily: 'SF Compact Rounded',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
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
                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: animal.length,
                    itemBuilder: (BuildContext buildContext, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedAnimalsIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: 16,
                            bottom: 16,
                            right: 16,
                          ),
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: index == selectedAnimalsIndex
                                ? const Color(0xFFFF9C41)
                                : AppColors.buttonColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Image.asset(animal[index]['img']),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  animal[index]['title'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontFamily: 'SF Compact Rounded',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
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
                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: industrial.length,
                    itemBuilder: (BuildContext buildContext, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndustrialIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                            top: 16,
                            bottom: 16,
                            right: 16,
                          ),
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: index == selectedIndustrialIndex
                                ? const Color(0xFFFF2D55)
                                : AppColors.buttonColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 4,
                                child: Image.asset(
                                  industrial[index]['img'],
                                  color: AppColors.textPrimary,
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  industrial[index]['title'],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontFamily: 'SF Compact Rounded',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
