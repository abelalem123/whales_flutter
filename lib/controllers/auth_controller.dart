import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  final firebaseAuth = FirebaseAuth.instance;

  // String get userId => firebaseAuth.currentUser!.uid;
  String get userId => 'aaaaaa';

  Future<void> signIn() async {
    try {
      if (firebaseAuth.currentUser != null) {
        return;
      }
      await firebaseAuth.signInAnonymously();
    } on FirebaseException catch (e) {
      debugPrint(e.toString());
    }
  }
}
