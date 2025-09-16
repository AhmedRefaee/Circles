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
            decoration: const InputDecoration(labelText: "Email Address"),
          ),
        ),

        SizedBox(height: 15.h),

        // Username Field
        SizedBox(
          height: 50.h,
          child: TextFormField(
            controller: widget.usernameController,
            onTapOutside: (event) {
              FocusScope.of(context).unfocus();
            },
            decoration: const InputDecoration(labelText: "Username"),
          ),
        ),

        SizedBox(height: 15.h),

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
