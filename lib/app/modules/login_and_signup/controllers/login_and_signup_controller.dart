import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    Get.offNamed(Routes.HOME);
    print('Arrow Button has been pressed.');
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
