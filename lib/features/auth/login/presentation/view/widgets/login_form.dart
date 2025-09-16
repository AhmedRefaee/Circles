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
            decoration: const InputDecoration(labelText: "Email Address"),
          ),
        ),

        SizedBox(height: 15.h),

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
              labelText: "Password",
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
