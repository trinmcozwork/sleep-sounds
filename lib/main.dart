import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/providers/favorite_provider.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/StartScreens/start_screen.dart';
import 'package:flutter_sleep_sounds/firebase_options.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return FavoriteProvider();
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StartScreen(),
      ),
    );
  }
}
