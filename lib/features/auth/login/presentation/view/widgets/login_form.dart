import 'package:circles/core/config/themes/app_spacing.dart';
import 'package:circles/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // State for password visibility is now managed here
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Email Field
        SizedBox(
          height: 50.h,
          child: TextFormField(
            controller: widget.emailController, // Use the passed controller
            keyboardType: TextInputType.emailAddress,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration(labelText: S.of(context).emailAddress),
          ),
        ),

        SizedBox(height: AppSpacing.verticalMedium),

        // Password Field
        SizedBox(
          height: 50.h,
          child: TextFormField(
            controller: widget.passwordController, // Use the passed controller
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            obscureText: _isObscured,
            decoration: InputDecoration(
              labelText: S.of(context).password,
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                  size: 20.sp,
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
