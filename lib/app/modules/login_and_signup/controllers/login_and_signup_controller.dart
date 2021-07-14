import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zineb_el_chat/app/core/utils/firebase_error_formatter.dart';
import 'package:zineb_el_chat/app/routes/app_pages.dart';

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
  final auth = FirebaseAuth.instance;

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
      auth
          .createUserWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextController.text,
      )
          .then(
        (newUser) {
          print('This is display name ==> ${newUser.user.displayName}');
          if (newUser != null) Get.offNamed(Routes.HOME);
        },
      ).onError(
        (error, stackTrace) {
          print('This is error ==> $error');
          Get.snackbar(
            FirebaseErrorFormatter.format(error['errorTitle']),
            FirebaseErrorFormatter.format(error['errorMessage']),
          );
        },
      );
    }
    // Sign In with Email & Password.
    if (!isSignupScreen.value) if (loginKey.currentState.validate()) {
      auth
          .signInWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextController.text,
      )
          .then(
        (user) {
          if (user != null) Get.offNamed(Routes.HOME);
        },
      ).onError(
        (error, stackTrace) {
          print('This is error ==> $error');
          Get.snackbar(
            FirebaseErrorFormatter.format(error['errorTitle']),
            FirebaseErrorFormatter.format(error['errorMessage']),
          );
        },
      );
    }
  }

  void sendDataToDatabase() {
    print('Creating Data...');
    createData();
  }

  void createData() {
    databaseReference
        .child("flutterDevsTeam1")
        .set({'name': 'Deepak Nishad', 'description': 'Team Lead'});
    databaseReference.child("flutterDevsTeam2").set(
        {'name': 'Yashwant Kumar', 'description': 'Senior Software Engineer'});
    databaseReference
        .child("flutterDevsTeam3")
        .set({'name': 'Akshay', 'description': 'Software Engineer'});
  }

  void readData() {
    databaseReference.once().then(
      (DataSnapshot snapshot) {
        print('Data : ${snapshot.value}.');
      },
    ).onError(
      (error, stackTrace) {
        print(error);
      },
    );
  }

  void updateData() {
    databaseReference.child('flutterDevsTeam1').update({'description': 'CEO'});
    databaseReference
        .child('flutterDevsTeam2')
        .update({'description': 'Team Lead'});
    databaseReference
        .child('flutterDevsTeam3')
        .update({'description': 'Senior Software Engineer'});
  }

  void deleteData() {
    databaseReference.child('flutterDevsTeam1').remove();
    databaseReference.child('flutterDevsTeam2').remove();
    databaseReference.child('flutterDevsTeam3').remove();
  }
}
