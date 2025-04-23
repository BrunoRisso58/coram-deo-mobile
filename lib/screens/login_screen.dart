import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_colors.dart';
import '../widgets/login_form_text_field.dart';
import '../widgets/auth_button.dart';
import '../services/auth_service.dart';
import '../widgets/coram_deo_logo.dart';
import '../helpers/snack_bar_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final AuthService authService = AuthService();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  Color emailBorderColor = AppColors.grayField;
  Color passwordBorderColor = AppColors.grayField;

  @override
  void dispose() {
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    String email = emailController.text;
    String password = passwordController.text;

    setState(() {
      if (email.isEmpty) {
        emailBorderColor = AppColors.error;
      } else {
        emailBorderColor = AppColors.grayField;
      }

      if (password.isEmpty) {
        passwordBorderColor = AppColors.error;
      } else {
        passwordBorderColor = AppColors.grayField;
      }
    });

    if (email.isEmpty || password.isEmpty) {
      SnackBarHelper.showError(context, 'Preencha todos os campos!');
      return;
    }

    bool success = await authService.login(email, password);
    if (success) {
      SnackBarHelper.showSuccess(context, 'Login realizado com sucesso!');
      print('Deu certo!'); // TODO: go to the default page
    } else {
      SnackBarHelper.showError(context, 'Email ou senha inválidos!');
    }
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.error,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CoramDeoLogo(),
              const SizedBox(height: 32),
              LoginFormTextField(
                labelText: 'Email',
                type: 'email',
                controller: emailController,
                focusNode: emailFocusNode,
                borderColor: emailBorderColor,
              ),
              const SizedBox(height: 16),
              LoginFormTextField(
                labelText: 'Senha',
                type: 'password',
                controller: passwordController,
                focusNode: passwordFocusNode,
                borderColor: passwordBorderColor,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                  child: Text(
                    'Esqueceu a senha?',
                    textAlign: TextAlign.end,
                    style: GoogleFonts.nunito(
                      fontSize: 13,
                      fontWeight: FontWeight.w900,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              AuthButton(
                text: 'Entrar',
                onPressed: _handleLogin,  // Passe a função para o botão
              ),
            ],
          ),
        ),
      ),
    );
  }
}
