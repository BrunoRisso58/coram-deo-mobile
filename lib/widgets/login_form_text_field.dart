import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class LoginFormTextField extends StatelessWidget {
  final String labelText;
  final String type;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Color borderColor;

  const LoginFormTextField({
    required this.labelText,
    required this.type,
    required this.controller,
    required this.focusNode,
    required this.borderColor,
    super.key,
  }) : assert(type == 'email' || type == 'password', 'Type must be either "email" or "password"');

  @override
  Widget build(BuildContext context) {
    var textStyle = GoogleFonts.nunito(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: AppColors.grayField,
    );

    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: type == 'email' ? TextInputType.emailAddress : TextInputType.visiblePassword,
        obscureText: type == 'password',
        style: textStyle,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: textStyle,
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primary,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(32.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: borderColor,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(32.0),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 14.0,
          ),
        ),
      ),
    );
  }
}