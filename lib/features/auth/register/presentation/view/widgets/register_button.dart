import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/features/auth/email_verification/presentation/view/email_verification_screen.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const RegisterButton({
    super.key,
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
  });

  void _handleSignUp(BuildContext context) {
    final email = emailController.text;
    final username = usernameController.text;
    final password = passwordController.text;
    print('Email: $email, Username: $username, Password: $password');
    // Add your sign-up logic here
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmailVerificationScreen(email: email),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _handleSignUp(context),
      child: Text("Register", style: AppTextStyles.regular),
    );
  }
}
