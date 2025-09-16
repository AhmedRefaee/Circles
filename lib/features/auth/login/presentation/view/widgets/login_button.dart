import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  void _handleSignIn() {
    final email = emailController.text;
    final password = passwordController.text;
    print('Email: $email, Password: $password');
    // Add your sign-in logic here
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: _handleSignIn, child: const Text("Login"));
  }
}
