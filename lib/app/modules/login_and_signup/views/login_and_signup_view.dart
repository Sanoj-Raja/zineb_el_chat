import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zineb_el_chat/app/core/constants/app_assets.dart';
import 'package:zineb_el_chat/app/core/constants/app_colors.dart';
import 'package:zineb_el_chat/app/core/utils/text_fields.dart';
import '../controllers/login_and_signup_controller.dart';
import 'package:flutter_icons/flutter_icons.dart';

class LoginAndSignupView extends GetView<LoginAndSignupController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          color: AppColors.whiteBackgroundColor,
          child: bottomGoogleLoginButton(),
        ),
        backgroundColor: AppColors.whiteBackgroundColor,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            upperTextAndImageContainer(),
            loginAndSignupCard(context),
          ],
        ),
      ),
    );
  }

  Positioned upperTextAndImageContainer() {
    return Positioned(
      top: 0,
      right: 0,
      left: 0,
      child: Container(
        height: Get.height * .4,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AppAssets.heroImage,
            ),
            fit: BoxFit.contain,
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(top: 50, left: 20),
          color: Color(0xFF3b5999).withOpacity(.85),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Welcome ",
                    style: TextStyle(
                      fontSize: 26,
                      letterSpacing: 2,
                      color: Colors.yellow[700],
                    ),
                    children: [
                      TextSpan(
                        text: controller.isSignupScreen.value
                            ? "to \nZineb El Chat"
                            : "Back to \nZineb El Chat",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.yellow[700],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  controller.isSignupScreen.value
                      ? "Sign Up to Continue"
                      : "Login to Continue",
                  style: TextStyle(
                    letterSpacing: 1,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginAndSignupCard(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: Duration(milliseconds: 700),
        curve: Curves.bounceInOut,
        top: controller.isSignupScreen.value
            ? Get.height * .2
            : Get.height * .25,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 700),
              curve: Curves.bounceInOut,
              height: controller.isSignupScreen.value ? 430 : 320,
              width: Get.width - 40,
              padding: EdgeInsets.only(
                bottom: 50,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.isSignupScreen.value = false;
                              },
                              child: Column(
                                children: [
                                  Text(
                                    "LOGIN",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: !controller.isSignupScreen.value
                                            ? AppColors.darkBlueActiveIconColor
                                            : AppColors.darkBlackTextColor),
                                  ),
                                  if (!controller.isSignupScreen.value)
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: 55,
                                      color: Colors.orange,
                                    )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.isSignupScreen.value = true;
                              },
                              child: Column(
                                children: [
                                  Text(
                                    "SIGNUP",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: controller.isSignupScreen.value
                                            ? AppColors.darkBlueActiveIconColor
                                            : AppColors.darkBlackTextColor),
                                  ),
                                  if (controller.isSignupScreen.value)
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: 55,
                                      color: Colors.orange,
                                    )
                                ],
                              ),
                            )
                          ],
                        ),
                        if (controller.isSignupScreen.value)
                          buildSignupSection(),
                        if (!controller.isSignupScreen.value)
                          buildLoginSection(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            loginAndSignupArrowButton(),
          ],
        ),
      ),
    );
  }

  Container buildLoginSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          UniversalTextField(
              icon: Icons.mail_outline,
              labelText: "Email",
              isPassword: false,
              isEmail: true),
          UniversalTextField(
            icon: MaterialCommunityIcons.lock_outline,
            labelText: "Email",
            isPassword: true,
            isEmail: false,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: controller.isRememberMe.value,
                    activeColor: AppColors.darkBlackTextColor,
                    onChanged: (value) {
                      controller.isRememberMe.value = value;
                    },
                  ),
                  Text(
                    "Remember me",
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.darkBlackTextColor,
                    ),
                  )
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.darkBlackTextColor,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          UniversalTextField(
            icon: MaterialCommunityIcons.account_outline,
            labelText: "User Name",
            isPassword: false,
            isEmail: false,
          ),
          UniversalTextField(
            icon: MaterialCommunityIcons.email_outline,
            labelText: "Email",
            isPassword: false,
            isEmail: true,
          ),
          UniversalTextField(
            icon: MaterialCommunityIcons.lock_outline,
            labelText: "Password",
            isPassword: true,
            isEmail: false,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 10, right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.isMale.value = true;
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: controller.isMale.value
                                ? AppColors.darkBlackTextColor
                                : Colors.transparent,
                            border: Border.all(
                                width: 1,
                                color: controller.isMale.value
                                    ? Colors.transparent
                                    : AppColors.darkBlackTextColor),
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          MaterialCommunityIcons.account_outline,
                          color: controller.isMale.value
                              ? Colors.white
                              : AppColors.greyIconColor,
                        ),
                      ),
                      Text(
                        "Male",
                        style: TextStyle(color: AppColors.darkBlackTextColor),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                GestureDetector(
                  onTap: () {
                    controller.isMale.value = false;
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        margin: EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                            color: controller.isMale.value
                                ? Colors.transparent
                                : AppColors.darkBlackTextColor,
                            border: Border.all(
                                width: 1,
                                color: controller.isMale.value
                                    ? AppColors.darkBlackTextColor
                                    : Colors.transparent),
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          MaterialCommunityIcons.account_outline,
                          color: controller.isMale.value
                              ? AppColors.greyIconColor
                              : Colors.white,
                        ),
                      ),
                      Text(
                        "Female",
                        style: TextStyle(color: AppColors.darkBlackTextColor),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          LimitedBox(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "By pressing 'Submit' you agree to our ",
                style: TextStyle(color: AppColors.darkBlackTextColor),
                children: [
                  TextSpan(
                    text: "\nterm & conditions",
                    style: TextStyle(color: Colors.orange),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Center loginAndSignupArrowButton() {
    return Center(
      child: InkWell(
        onTap: controller.onArrowButtonPress,
        child: Container(
          height: 90,
          width: 90,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.3),
                spreadRadius: 1.5,
                blurRadius: 10,
              )
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.red[400]],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                )
              ],
            ),
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomGoogleLoginButton() {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        margin: EdgeInsets.only(right: 20, left: 20, top: 15),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              controller.isSignupScreen.value
                  ? buildTextButton(
                      MaterialCommunityIcons.google_plus,
                      'Sign up with Google',
                      AppColors.redGoogleIconColor,
                    )
                  : buildTextButton(
                      MaterialCommunityIcons.google_plus,
                      'Log in with Google',
                      AppColors.redGoogleIconColor,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

TextButton buildTextButton(IconData icon, String title, Color backgroundColor) {
  return TextButton(
    onPressed: () {
      print('button has been clicked.');
    },
    style: TextButton.styleFrom(
        side: BorderSide(width: 1, color: Colors.grey),
        minimumSize: Size(Get.width * .8, Get.height * .06),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        primary: Colors.white,
        backgroundColor: backgroundColor),
    child: Row(
      children: [
        Icon(
          icon,
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: Get.textTheme.headline6.copyWith(
            fontSize: 18,
            color: Colors.white,
          ),
        )
      ],
    ),
  );
}
