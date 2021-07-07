import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zineb_el_chat/app/core/constants/app_colors.dart';
import 'package:zineb_el_chat/app/routes/app_pages.dart';
import 'package:zineb_el_chat/app/widgets/active_members.dart';
import 'package:zineb_el_chat/app/widgets/recent_chats.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightPinkSplashColor,
      appBar: AppBar(
        backgroundColor: AppColors.lightPinkSplashColor,
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 30.0,
          color: AppColors.lightBlueInactiveIconColor,
          onPressed: () {},
        ),
        centerTitle: true,
        title: Text(
          'Zineb El Chat',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: AppColors.lightBlueInactiveIconColor,
          ),
        ),
        elevation: 1.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            iconSize: 30.0,
            color: AppColors.lightBlueInactiveIconColor,
            onPressed: () {
              print('Logout has been clicked.');
              Get.offAllNamed(Routes.LOGIN_AND_SIGNUP);
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: AppColors.lightPinkSplashColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            ActiveMembers(),
            SizedBox(
              height: 4,
            ),
            RecentChats(),
          ],
        ),
      ),
    );
  }
}
