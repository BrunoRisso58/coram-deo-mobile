import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class HomePageButton extends StatelessWidget {
  final String text;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;
  
  const HomePageButton({
    required this.text,
    this.color,
    this.backgroundColor,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.70,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.primary,
          padding: EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 14.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32.0),
            side: BorderSide(
              color: AppColors.primary,
              width: .5
            )
          ),
        ),
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: color ?? AppColors.white,
          ),
        ),
      ),
    );
  }
}