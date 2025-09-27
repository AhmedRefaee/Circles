import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Reusable Password TextField Component - follows Single Responsibility Principle
/// Only responsible for rendering a password input field with visibility toggle
class PasswordTextField extends StatefulWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final VoidCallback? onTapOutside;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;

  const PasswordTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.focusNode,
    this.validator,
    this.onTapOutside,
    this.textInputAction,
    this.onFieldSubmitted,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          suffixIcon: IconButton(
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
          ),
        ),
        obscureText: !_isPasswordVisible,
        controller: widget.controller,
        focusNode: widget.focusNode,
        validator: widget.validator,
        onTapOutside: widget.onTapOutside != null
            ? (event) => widget.onTapOutside!()
            : null,
        textInputAction: widget.textInputAction,
        onFieldSubmitted: widget.onFieldSubmitted,
      ),
    );
  }
}
