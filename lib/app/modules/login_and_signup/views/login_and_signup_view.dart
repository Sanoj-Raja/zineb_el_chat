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
          elevation: 0,
          color: AppColors.offWhiteBackgroundColor,
          child: bottomGoogleLoginButton(),
        ),
        backgroundColor: AppColors.offWhiteBackgroundColor,
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
          color: AppColors.secondaryAppThemeColor.withOpacity(.8),
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
                      color: AppColors.primaryAppThemeColor,
                    ),
                    children: [
                      TextSpan(
                        text: controller.isSignupScreen.value
                            ? "to \nZineb El Chat"
                            : "Back to \nZineb El Chat",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryAppThemeColor,
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
                      ? "Signup to Continue"
                      : "Login to Continue",
                  style: TextStyle(
                    letterSpacing: 1,
                    color: AppColors.primaryAppThemeColor,
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
                            InkWell(
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
                                          ? AppColors.primaryAppThemeColor
                                          : AppColors.lightInactiveColor,
                                    ),
                                  ),
                                  if (!controller.isSignupScreen.value)
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: 55,
                                      color: AppColors.primaryAppThemeColor,
                                    )
                                ],
                              ),
                            ),
                            InkWell(
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
                                          ? AppColors.primaryAppThemeColor
                                          : AppColors.lightInactiveColor,
                                    ),
                                  ),
                                  if (controller.isSignupScreen.value)
                                    Container(
                                      margin: EdgeInsets.only(top: 3),
                                      height: 2,
                                      width: 55,
                                      color: AppColors.primaryAppThemeColor,
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
      child: Form(
        key: controller.loginKey,
        child: Column(
          children: [
            UniversalTextField(
              icon: Icons.mail_outline,
              labelText: "Email",
              isPassword: false,
              controller: controller.emailTextController,
              isEmail: true,
            ),
            UniversalTextField(
              icon: MaterialCommunityIcons.lock_outline,
              labelText: "Password",
              isPassword: true,
              isEmail: false,
              controller: controller.passwordTextController,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Theme(
                      data: Get.theme.copyWith(
                        unselectedWidgetColor: AppColors.primaryAppThemeColor,
                      ),
                      child: Checkbox(
                        value: controller.isRememberMe.value,
                        activeColor: AppColors.primaryAppThemeColor,
                        onChanged: (value) {
                          controller.isRememberMe.value = value;
                        },
                      ),
                    ),
                    Text(
                      "Remember Me",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.primaryAppThemeColor,
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
                      color: AppColors.primaryAppThemeColor,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Container buildSignupSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Form(
        key: controller.signUpKey,
        child: Column(
          children: [
            UniversalTextField(
              icon: MaterialCommunityIcons.account_outline,
              labelText: "User Name",
              isPassword: false,
              isEmail: false,
              controller: controller.userNameTextController,
            ),
            UniversalTextField(
              icon: MaterialCommunityIcons.email_outline,
              labelText: "Email",
              isPassword: false,
              controller: controller.emailTextController,
              isEmail: true,
            ),
            UniversalTextField(
              icon: MaterialCommunityIcons.lock_outline,
              labelText: "Password",
              isPassword: true,
              isEmail: false,
              controller: controller.passwordTextController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  selectMaleGender(),
                  SizedBox(
                    width: 30,
                  ),
                  selectFemaleGender(),
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
                  text: "By pressing 'Button' you agree to our ",
                  style: TextStyle(color: AppColors.textColor),
                  children: [
                    TextSpan(
                      text: "\nTerm & Conditions.",
                      style: TextStyle(color: AppColors.primaryAppThemeColor),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InkWell selectMaleGender() {
    return InkWell(
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
              border: Border.all(
                width: 1.2,
                color: controller.isMale.value
                    ? AppColors.primaryAppThemeColor
                    : AppColors.lightInactiveColor,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              MaterialCommunityIcons.human_male,
              color: controller.isMale.value
                  ? AppColors.primaryAppThemeColor
                  : AppColors.lightInactiveColor,
            ),
          ),
          Text(
            'Male',
            style: TextStyle(
              color: controller.isMale.value
                  ? AppColors.primaryAppThemeColor
                  : AppColors.lightInactiveColor,
            ),
          )
        ],
      ),
    );
  }

  InkWell selectFemaleGender() {
    return InkWell(
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
              border: Border.all(
                width: 1.2,
                color: !controller.isMale.value
                    ? AppColors.primaryAppThemeColor
                    : AppColors.lightInactiveColor,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              MaterialCommunityIcons.human_female,
              color: !controller.isMale.value
                  ? AppColors.primaryAppThemeColor
                  : AppColors.lightInactiveColor,
            ),
          ),
          Text(
            'Female',
            style: TextStyle(
              color: !controller.isMale.value
                  ? AppColors.primaryAppThemeColor
                  : AppColors.lightInactiveColor,
            ),
          )
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
              gradient: LinearGradient(colors: [
                AppColors.secondaryAppThemeColor,
                AppColors.primaryAppThemeColor,
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
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
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              controller.isSignupScreen.value
                  ? buildTextButton(
                      MaterialCommunityIcons.google_plus,
                      'Sign up with Google',
                      AppColors.primaryAppThemeColor,
                    )
                  : buildTextButton(
                      MaterialCommunityIcons.google_plus,
                      'Log in with Google',
                      AppColors.primaryAppThemeColor,
                    ),
              // Text('CLick')
            ],
          ),
        ),
      ),
    );
  }

  TextButton buildTextButton(
      IconData icon, String title, Color backgroundColor) {
    return TextButton(
      onPressed: () {
        print('Google button has been pressed.');
      },
      style: TextButton.styleFrom(
          side: BorderSide(
            width: 1,
            color: AppColors.secondaryAppThemeColor,
          ),
          minimumSize: Size(
            Get.width * .8,
            Get.height * .06,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
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
}
