import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:zineb_el_chat/app/routes/app_pages.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SplashView'),
        centerTitle: true,
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Get.toNamed(Routes.LOGIN_AND_SIGNUP);
          },
          child: Text(
            'SplashView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
