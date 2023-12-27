import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/providers/Favorite.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/providers/audio_player.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/StartScreens/start_screen.dart';
import 'package:provider/provider.dart';

import 'feature/tri_implement_xxx/services/firebase/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return FavoriteProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return AudioPlayerProvider();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const StartScreen(),
        theme: ThemeData(fontFamily: 'Nunito'),
      ),
    );
  }
}
