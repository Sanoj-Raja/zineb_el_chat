import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zineb_el_chat/app/core/constants/app_colors.dart';

class UniversalTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  final String labelText;
  final bool isPassword;
  final bool isEmail;

  const UniversalTextField({
    Key key,
    @required this.controller,
    @required this.icon,
    this.hintText,
    @required this.isPassword,
    @required this.isEmail,
    @required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        validator: (value) {
          return isPassword
              ? value.length >= 8
                  ? null
                  : 'Password must be 8 characters!'
              : isEmail
                  ? GetUtils.isEmail(value)
                      ? null
                      : 'Please enter a valid email address.'
                  : value.length >= 3
                      ? null
                      : 'Please enter a correct $labelText!';
        },
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryAppThemeColor),
            borderRadius: BorderRadius.all(
              Radius.circular(35.0),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryAppThemeColor),
            borderRadius: BorderRadius.all(
              Radius.circular(35.0),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryAppThemeColor),
            borderRadius: BorderRadius.all(
              Radius.circular(35.0),
            ),
          ),
          prefixIcon: Icon(
            icon,
            color: AppColors.primaryAppThemeColor,
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle:
              TextStyle(fontSize: 14, color: AppColors.primaryAppThemeColor),
          labelText: labelText,
          labelStyle:
              TextStyle(fontSize: 14, color: AppColors.primaryAppThemeColor),
        ),
      ),
    );
  }
}
