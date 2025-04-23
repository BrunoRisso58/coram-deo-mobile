import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class CoramDeoLogo extends StatelessWidget {
  const CoramDeoLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Coram Deo',
      style: GoogleFonts.caveat(
        fontSize: 46,
        fontWeight: FontWeight.normal,
        color: AppColors.primary,
      ),
    );
  }
}