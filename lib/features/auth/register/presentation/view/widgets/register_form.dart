import 'package:circles/core/config/themes/app_spacing.dart';
import 'package:circles/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  const RegisterForm({
    super.key,
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
  });

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  // State for password visibility is managed here
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Email Field
        SizedBox(
          height: 50.h,
          child: TextFormField(
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration(
              labelText: S.of(context).emailAddress,
              hintText: S.of(context).enterEmailAddressPlaceholder,
            ),
          ),
        ),

        SizedBox(height: AppSpacing.verticalMedium),

        // Username Field
        SizedBox(
          height: 50.h,
          child: TextFormField(
            controller: widget.usernameController,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            decoration: InputDecoration(
              labelText: S.of(context).username,
              hintText: S.of(context).enterUsernamePlaceholder,
            ),
          ),
        ),

        SizedBox(height: AppSpacing.verticalMedium),

        // Password Field
        SizedBox(
          height: 50.h,
          child: TextFormField(
            controller: widget.passwordController,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            obscureText: _isObscured,
            decoration: InputDecoration(
              labelText: S.of(context).password,
              hintText: S.of(context).enterPasswordPlaceholder,
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
