import 'package:flutter/material.dart';
import 'package:zineb_el_chat/app/core/constants/app_colors.dart';

class UniversalTextField extends StatelessWidget {
  final IconData icon;
  final String hintText;
  final String labelText;
  final bool isPassword;
  final bool isEmail;

  const UniversalTextField({
    Key key,
    this.icon,
    this.hintText,
    this.isPassword,
    this.isEmail,
    this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        validator: (value) {
          return isPassword
              ? value.length >= 8
                  ? null
                  : 'Please enter valid password!'
              : value.length >= 3
                  ? null
                  : 'Please enter a correct $labelText!';
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: AppColors.iconColor,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.textColor1),
            borderRadius: BorderRadius.all(Radius.circular(35.0)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 14, color: AppColors.textColor1),
          labelText: labelText,
          labelStyle: TextStyle(fontSize: 14, color: AppColors.textColor1),
        ),
      ),
    );
  }
}
