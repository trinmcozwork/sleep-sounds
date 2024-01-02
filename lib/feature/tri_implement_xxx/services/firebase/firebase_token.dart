import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_sleep_sounds/feature/tri_implement_xxx/screens/start/start_screen.dart';

class FirebaseToken {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final storage = const FlutterSecureStorage();
  void getToken() async {
    firebaseMessaging.getToken().then((token) async {
      // if (kDebugMode) {
      //   print("Initial Token: $token");
      // }
      await storage.write(key: 'token', value: token);
    });
  }

  void onTokenRefresh() {
    firebaseMessaging.onTokenRefresh.listen((newToken) async {
      if (kDebugMode) {
        print("Token refreshed: $newToken");
      }
      _handleTokenRefresh(newToken);
    });
  }

  void _handleTokenRefresh(String newToken) async {
    _showTokenRefreshDialog();
    await storage.write(key: 'token', value: newToken);
  }

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  void _showTokenRefreshDialog() {
    showDialog(
      context: navigatorKey.currentState!.overlay!.context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Token Refreshed'),
          content: const Text('Your session has expired. Please log in again.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const StartScreen(),
                  ),
                  (Route<dynamic> route) => false,
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
