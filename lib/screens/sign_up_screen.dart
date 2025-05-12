import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../services/auth_service.dart';
import '../widgets/login_form_text_field.dart';
import '../widgets/auth_button.dart';
import '../widgets/coram_deo_logo.dart';
import '../helpers/snack_bar_helper.dart';
import '../widgets/checkbox_terms.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int _currentPage = 0;
  final Duration _transitionDuration = const Duration(milliseconds: 300);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final AuthService authService = AuthService();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();
  Color nameBorderColor = AppColors.grayField;
  Color phoneBorderColor = AppColors.grayField;
  Color emailBorderColor = AppColors.grayField;
  Color passwordBorderColor = AppColors.grayField;
  Color confirmPasswordBorderColor = AppColors.grayField;

  bool acceptedTerms = false;

  @override
  void dispose() {
    nameFocusNode.dispose();
    phoneFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (nameController.text.isEmpty || phoneController.text.isEmpty) {
      SnackBarHelper.showError(context, 'Preencha todos os campos!');
      return;
    }
    setState(() => _currentPage = 1);
  }

  void _goToPreviousPage() {
    setState(() => _currentPage = 0);
  }

  Future<void> _handleSignUp() async {
    String name = nameController.text;
    String phone = phoneController.text;
    String email = emailController.text;
    String password = passwordController.text;
    String confirmPassword= confirmPasswordController.text;

    if (password != confirmPassword) {
      SnackBarHelper.showError(context, 'As senhas não coincidem!');
      return;
    }

    setState(() {
      if (name.isEmpty) {
        nameBorderColor = AppColors.error;
      } else {
        nameBorderColor = AppColors.grayField;
      }

      if (phone.isEmpty) {
        phoneBorderColor = AppColors.error;
      } else {
        phoneBorderColor = AppColors.grayField;
      }

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

      if (confirmPassword.isEmpty) {
        confirmPasswordBorderColor = AppColors.error;
      } else {
        confirmPasswordBorderColor = AppColors.grayField;
      }
    });

    if (
      name.isEmpty ||
      phone.isEmpty ||
      email.isEmpty ||
      password.isEmpty ||
      confirmPassword.isEmpty
    ) {
      SnackBarHelper.showError(context, 'Preencha todos os campos!');
      return;
    }

    if (!acceptedTerms) {
      SnackBarHelper.showError(context, 'Você deve aceitar os termos de uso!');
      return;
    }

    bool success = await authService.signUp(name, phone, email, password, confirmPassword);
    if (success) {
      SnackBarHelper.showSuccess(context, 'Bem vindo!');
      // TODO: go to the goals page
    } else {
      SnackBarHelper.showError(context, 'Erro ao cadastrar usuário!');
    }
  }

  Widget _buildStepOne() {
    return Column(
      key: const ValueKey(0),
      children: [
        CoramDeoLogo(),
        const SizedBox(height: 16),
        LoginFormTextField(
          labelText: 'Nome',
          type: 'name',
          controller: nameController,
          focusNode: nameFocusNode,
          borderColor: nameBorderColor,
        ),
        const SizedBox(height: 16),
        LoginFormTextField(
          labelText: 'Telefone',
          type: 'phone',
          controller: phoneController,
          focusNode: phoneFocusNode,
          borderColor: phoneBorderColor,
        ),
        const SizedBox(height: 32),
        AuthButton(
          text: 'Próximo',
          onPressed: _goToNextPage,
          width: MediaQuery.of(context).size.width * 0.50,
        )
      ],
    );
  }

  Widget _buildStepTwo() {
    return Column(
      key: const ValueKey(1),
      children: [
        CoramDeoLogo(),
        const SizedBox(height: 16),
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
        const SizedBox(height: 16),
        LoginFormTextField(
          labelText: 'Confirmação de senha',
          type: 'password',
          controller: confirmPasswordController,
          focusNode: confirmPasswordFocusNode,
          borderColor: confirmPasswordBorderColor,
        ),
        const SizedBox(height: 8),
        CheckboxTerms(
          isChecked: acceptedTerms,
          onChanged: (value) {
            setState(() {
              acceptedTerms = value ?? false;
            });
          },
        ),
        AuthButton(
          text: 'Cadastre-se',
          onPressed: _handleSignUp,
        ),
      ],
    );
  }

  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(2, (index) {
        if (_currentPage == 1) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primary,
                width: 2,
              ),
            )
          );
        } else {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: _currentPage == index ? AppColors.primary : AppColors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primary,
                width: 2,
              ),
            )
          );
        }
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    GestureDetector(
                      onHorizontalDragEnd: (details) {
                        if (details.primaryVelocity != null) {
                          if (details.primaryVelocity! > 0 && _currentPage == 1) {
                            setState(() {
                              _currentPage = 0;
                            });
                          } else if (details.primaryVelocity! < 0 && _currentPage == 0) {
                            setState(() {
                              _currentPage = 1;
                            });
                          }
                        }
                      },
                      child: AnimatedSwitcher(
                        duration: _transitionDuration,
                        transitionBuilder: (child, animation) {
                          final offsetAnimation = Tween<Offset>(
                            begin: Offset(_currentPage == 0 ? -1 : 1, 0),
                            end: Offset.zero,
                          ).animate(animation);
                          return FadeTransition(
                            opacity: animation,
                            child: SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            ),
                          );
                        },
                        child: _currentPage == 0 ? _buildStepOne() : _buildStepTwo(),
                      ),
                    ),
                    const SizedBox(height: 80), // Espaço pro indicador não sobrepor
                  ],
                ),
              ),
            ),
          ),
          // Indicador fixo
          Positioned(
            bottom: 180,
            left: 0,
            right: 0,
            child: _buildPageIndicator(),
          ),
        ],
      ),
    );
  }

}