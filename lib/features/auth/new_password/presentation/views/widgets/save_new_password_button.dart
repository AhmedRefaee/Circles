import 'package:circles/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Pure UI Component - follows Single Responsibility Principle
/// Only responsible for rendering the button UI
class SaveNewPasswordButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isEnabled;
  final String? buttonText;

  const SaveNewPasswordButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
    required this.isEnabled,
    this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 50.h,
        width: 200.w,
        child: ElevatedButton(
          onPressed: (isLoading || !isEnabled) ? null : onPressed,
          child: isLoading
              ? const CircularProgressIndicator()
              : FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(buttonText ?? S.of(context).save),
                ),
        ),
      ),
    );
  }
}
