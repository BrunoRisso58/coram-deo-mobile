import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import 'package:provider/provider.dart';
import '../providers/goal_provider.dart';

class SuggestionCard extends StatelessWidget {
  final String text;
  final IconData icon;

  const SuggestionCard(this.text, this.icon, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<GoalProvider>(context, listen: false)
          .setSelectedGoal(text, icon);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Card(
            color: AppColors.white,
            shadowColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    color: AppColors.accent,
                    size: 26
                  ),
                  SizedBox(width: 10),
                  Text(
                    text,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class FormTitle extends StatelessWidget {
  final String text;

  const FormTitle(this.text, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.primary,
      ),
    );
  }
}