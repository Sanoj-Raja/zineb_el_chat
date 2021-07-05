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
        backgroundColor: AppColors.backgroundColor,
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            upperTextAndImageContainer(),
            loginAndSignupCard(context),
            arrowButtonForLoginAndSignup(true),
            bottomGoogleLoginButton()
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
        child: AnimatedContainer(
          duration: Duration(milliseconds: 700),
          curve: Curves.bounceInOut,
          height: controller.isSignupScreen.value ? 380 : 270,
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 25,
          ),
          width: MediaQuery.of(context).size.width - 40,
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 15,
                spreadRadius: 5,
              ),
            ],
          ),
          child: SingleChildScrollView(
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
                                    ? AppColors.activeColor
                                    : AppColors.textColor1),
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
                                    ? AppColors.activeColor
                                    : AppColors.textColor1),
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
                if (controller.isSignupScreen.value) buildSignupSection(),
                if (!controller.isSignupScreen.value) buildLoginSection()
              ],
            ),
          ),
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
                    activeColor: AppColors.textColor2,
                    onChanged: (value) {
                      controller.isRememberMe.value = value;
                    },
                  ),
                  Text("Remember me",
                      style:
                          TextStyle(fontSize: 12, color: AppColors.textColor1))
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text("Forgot Password?",
                    style:
                        TextStyle(fontSize: 12, color: AppColors.textColor1)),
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
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                ? AppColors.textColor2
                                : Colors.transparent,
                            border: Border.all(
                                width: 1,
                                color: controller.isMale.value
                                    ? Colors.transparent
                                    : AppColors.textColor1),
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          MaterialCommunityIcons.account_outline,
                          color: controller.isMale.value
                              ? Colors.white
                              : AppColors.iconColor,
                        ),
                      ),
                      Text(
                        "Male",
                        style: TextStyle(color: AppColors.textColor1),
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
                                : AppColors.textColor2,
                            border: Border.all(
                                width: 1,
                                color: controller.isMale.value
                                    ? AppColors.textColor1
                                    : Colors.transparent),
                            borderRadius: BorderRadius.circular(15)),
                        child: Icon(
                          MaterialCommunityIcons.account_outline,
                          color: controller.isMale.value
                              ? AppColors.iconColor
                              : Colors.white,
                        ),
                      ),
                      Text(
                        "Female",
                        style: TextStyle(color: AppColors.textColor1),
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
                style: TextStyle(color: AppColors.textColor2),
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

  Widget arrowButtonForLoginAndSignup(bool showShadow) {
    return Obx(
      () => AnimatedPositioned(
        duration: Duration(milliseconds: 700),
        curve: Curves.bounceInOut,
        top: controller.isSignupScreen.value
            ? Get.height * .65
            : Get.height * .55,
        right: 0,
        left: 0,
        child: Center(
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
      ),
    );
  }

  Widget bottomGoogleLoginButton() {
    return Positioned(
      top: Get.height * .85,
      right: 0,
      left: 0,
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
                      AppColors.googleIconColor,
                    )
                  : buildTextButton(
                      MaterialCommunityIcons.google_plus,
                      'Log in with Google',
                      AppColors.googleIconColor,
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
    onPressed: () {},
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
