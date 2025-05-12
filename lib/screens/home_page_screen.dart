import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../widgets/coram_deo_logo.dart';
import '../widgets/home_page_button.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CoramDeoLogo(),
              const SizedBox(height: 32),
              Text(
                'Acompanhe sua jornada \n espiritual rumo ao crescimento!',
                style: GoogleFonts.nunito(
                  fontSize: 22,
                  fontWeight: FontWeight.normal,
                  color: AppColors.primary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 100),
              HomePageButton(
                text: 'Comece agora',
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-up');
                },
              ),
              const SizedBox(height: 10),
              HomePageButton(
                text: 'Entrar',
                color: AppColors.primary,
                backgroundColor: AppColors.secondary,
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}