import 'package:flutter/material.dart';
import 'theme/app_colors.dart';
import 'screens/home_page_screen.dart';
import 'screens/login_screen.dart';
import 'screens/sign_up_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePageScreen(),
        '/login': (context) => const LoginScreen(),
        '/sign-up': (context) => const SignUpScreen(),
      },
      title: 'Coram Deo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.primary,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary
        ),
        useMaterial3: true,
      ),
    );
  }
}
