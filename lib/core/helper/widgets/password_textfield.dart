// lib/core/utils/widgets/custom_textfield.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/core/config/themes/theme_extensions/theme_extenstions.dart';

class PasswordTextfield extends StatefulWidget {
  final String label;
  final String? hint;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const PasswordTextfield({
    super.key,
    required this.label,
    this.hint,
    this.validator,
    this.controller,
    this.onChanged,
  });

  @override
  State<PasswordTextfield> createState() => _PasswordTextfieldState();
}

class _PasswordTextfieldState extends State<PasswordTextfield> {
  bool _obscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      style: AppTextStyles.fourteen,
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscured,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hint,
        suffixIcon: IconButton(
          icon: Icon(
            _obscured ? Icons.visibility : Icons.visibility_off,
            size: 20.sp,
            color: context.colors.secondary,
          ),
          onPressed: () {
            setState(() {
              _obscured = !_obscured;
            });
          },
        ),
      ),
    );
  }
}