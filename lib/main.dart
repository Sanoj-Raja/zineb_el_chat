import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zineb_el_chat/app/core/constants/app_colors.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  runZonedGuarded<Future<void>>(
    () async {
      runApp(
        GetMaterialApp(
          title: "Zineb El Chat",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
        ),
      );
    },
    (dynamic error, StackTrace stackTrace) {
      print('<<----------ERROR--------->> \n$error $stackTrace');
      Get.defaultDialog(
        title: 'Unknown Error Occured.',
        middleText: 'Something went wrong try again later.',
        middleTextStyle: TextStyle(fontSize: 18),
        radius: 5,
        buttonColor: AppColors.primaryAppThemeColor,
        confirmTextColor: AppColors.textColor,
        textConfirm: 'Go Back',
        onConfirm: () {
          Get.back();
          // One back for closing the pop up.
          // other one for back navigation from the error page.
          Get.back();
        },
      );
    },
  );
}
