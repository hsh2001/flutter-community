import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final firbaseInstance = FirebaseAuth.instance;

class UserProvider extends ChangeNotifier {
  User? _user;
  get user => _user;

  Future<User?> login() async {
    final googleSignIn = GoogleSignIn();
    final account = await googleSignIn.signIn();

    if (account == null) {
      return null;
    }

    final googleAuth = await account.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final authResult = await firbaseInstance.signInWithCredential(credential);

    return _user = authResult.user;
  }
}
