import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';

class CheckboxTerms extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  const CheckboxTerms({
    Key? key,
    required this.isChecked,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: isChecked,
          onChanged: onChanged,
          activeColor: AppColors.primary,
          checkColor: Colors.white,
          splashRadius: 20,
        ),
        Transform.translate(
          offset: Offset(-8, 0),
          child: Text(
            'Li e aceito os termos de uso desse aplicativo',
            style: GoogleFonts.nunito(
              fontSize: 9,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}