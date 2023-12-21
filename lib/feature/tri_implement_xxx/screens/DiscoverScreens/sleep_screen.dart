import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_colors.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/assets/app_icons.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/models/sounds_details.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/DiscoverScreens/widgets/grid_view_song.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SleepScreen extends StatefulWidget {
  const SleepScreen({super.key});

  @override
  State<SleepScreen> createState() => _SleepScreenState();
}

class _SleepScreenState extends State<SleepScreen> {
  List loadList = [];

  Future<List<SoundsDetails>> fetchData() async {
    const apiUrl = 'https://6572aae9192318b7db407e1b.mockapi.io/mydata';

    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

      setState(() {
        loadList = jsonResponse;
      });
      return jsonResponse.map((data) => SoundsDetails.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                  top: 44,
                  left: 16,
                ),
                child: const Text(
                  'Discover',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19),
                        color: AppColors.systemPrimary,
                      ),
                      child: Row(
                        children: [
                          Image.asset(AppIcons.keypad),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text(
                            'All',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19),
                        color: AppColors.buttonColor,
                      ),
                      child: Row(
                        children: [
                          Image.asset(AppIcons.meditation),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text(
                            'Ambient',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(19),
                        color: AppColors.buttonColor,
                      ),
                      child: Row(
                        children: [
                          Image.asset(AppIcons.infant),
                          const SizedBox(
                            width: 4,
                          ),
                          const Text(
                            'For Kid',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: FutureBuilder<List>(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridViewSongs(loadList: loadList);
                  } else if (snapshot.hasError) {
                    return const Text('Error');
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
