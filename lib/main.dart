import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:coram_deo/screens/create_goals_screen.dart';
import 'package:flutter/material.dart';
import 'theme/app_colors.dart';
import 'screens/home_page_screen.dart';
import 'screens/login_screen.dart';
import 'screens/sign_up_screen.dart';
import 'package:provider/provider.dart';
import 'providers/goal_provider.dart';

void main() async {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => GoalProvider()),
    ],
    child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('pt', 'BR'),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialRoute: '/create-goals',
      routes: {
        '/': (context) => const HomePageScreen(),
        '/login': (context) => const LoginScreen(),
        '/sign-up': (context) => const SignUpScreen(),
        '/create-goals': (context) => const CreateGoalsScreen(),
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
