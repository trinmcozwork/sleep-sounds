import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/contains/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/models/content_login.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/services/navigation/bottom_navigation.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/start/widgets/indicator.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/start/widgets/page_view_item.dart';

class PageViewLogin extends StatefulWidget {
  const PageViewLogin({super.key});

  @override
  State<PageViewLogin> createState() => _PageViewLoginState();
}

class _PageViewLoginState extends State<PageViewLogin> {
  PageController pageController = PageController();
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 20,
          child: PageView.builder(
            onPageChanged: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            controller: pageController,
            scrollDirection: Axis.horizontal,
            itemCount: pages.length,
            itemBuilder: (context, index) {
              index = selectedIndex;
              return PageViewItem(pageContent: pages[index]);
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                pages.length,
                (index) {
                  return Indicator(
                    isActive: selectedIndex == index ? true : false,
                  );
                },
              )
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: () {
              if (selectedIndex == 2) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyBottomNavigation(false),
                  ),
                );
              } else {
                setState(() {
                  selectedIndex = selectedIndex + 1;
                });
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 150,
              ),
              decoration: BoxDecoration(
                color: AppColors.buttonColor,
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: Text(
                selectedIndex == 2 ? 'Start' : 'Next',
                style: const TextStyle(
                  color: AppColors.textPrimary,
                  fontSize: 17,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
