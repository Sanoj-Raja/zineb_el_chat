import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zineb_el_chat/app/core/constants/app_assets.dart';
import 'package:zineb_el_chat/app/core/constants/app_colors.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    controller.onInit();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.secondaryAppThemeColor,
        body: Center(
          child: Container(
            height: 250,
            width: 250,
            child: Image.asset(AppAssets.splashLogo),
          ),
        ),
      ),
    );
  }
}
