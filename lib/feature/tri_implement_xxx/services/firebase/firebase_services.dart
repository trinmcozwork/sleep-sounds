// ignore_for_file: file_names, use_rethrow_when_possible, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        await _auth.signInWithCredential(authCredential);
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }

  userCredential() async {
    UserCredential? userCredential = await signInWithGoogle();
    User? user = userCredential?.user;
    print('User ID: ${user?.uid}');
    print('Display Name: ${user?.displayName}');
    print('Email: ${user?.email}');
    print('Photo URL: ${user?.photoURL}');
    print('ID Token: ${userCredential?.credential?.token}');
    print('Access Token: ${userCredential?.credential?.accessToken}');
  }

  signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
