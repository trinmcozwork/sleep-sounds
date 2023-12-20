import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/models/page_content.dart';

class PageViewItem extends StatelessWidget {
  final PageContent pageContent;

  const PageViewItem({Key? key, required this.pageContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(pageContent.imagePath),
        const SizedBox(height: 50),
        Text(
          pageContent.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 34,
            fontFamily: 'SF Pro Rounded',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            pageContent.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0x99EBEBF5),
              fontSize: 17,
              fontFamily: 'SF Pro Rounded',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
