import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_assets.dart';

class PageContent {
  final String imagePath;
  final String title;
  final String description;

  PageContent(
      {required this.imagePath,
      required this.title,
      required this.description});
}

List<PageContent> pages = [
  PageContent(
    imagePath: AppAssets.relax_sounds_stp1,
    title: 'Exclusive sounds',
    description:
        "We have an author's library of sounds that you will not find anywhere else",
  ),
  PageContent(
    imagePath: AppAssets.relax_sounds_stp2,
    title: 'Relax sleep sounds',
    description: 'Our sounds will help to relax and improve your sleep health',
  ),
  PageContent(
    imagePath: AppAssets.relax_sounds_stp3,
    title: 'Story for kids',
    description:
        'Famous fairy tales with soothing sounds will help your children fall asleep faster',
  ),
];
