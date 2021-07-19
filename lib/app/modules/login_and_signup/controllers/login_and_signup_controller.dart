import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zineb_el_chat/app/services/firebase_auth_service.dart';

class LoginAndSignupController extends GetxController {
  RxBool isSignupScreen = true.obs;
  RxBool isMale = true.obs;
  RxBool isRememberMe = true.obs;
  final userNameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final loginKey = GlobalKey<FormState>();
  final signUpKey = GlobalKey<FormState>();
  final databaseReference = FirebaseDatabase.instance.reference();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void onArrowButtonPress() {
    // Sign Up with Email & Password.
    if (isSignupScreen.value) if (signUpKey.currentState.validate()) {
      FirebaseAuthService.signUp(
          emailTextController.text, passwordTextController.text);
    }
    // Sign In with Email & Password.
    if (!isSignupScreen.value) if (loginKey.currentState.validate()) {
      FirebaseAuthService.login(
          emailTextController.text, passwordTextController.text);
    }
  }
}
