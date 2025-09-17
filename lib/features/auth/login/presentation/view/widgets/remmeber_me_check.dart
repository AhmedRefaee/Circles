import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/generated/l10n.dart';
import 'package:flutter/material.dart';

class RememberMeCheck extends StatelessWidget {
  const RememberMeCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: () {
          // Handle remember me toggle
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Checkbox(
              value: false,
              onChanged: (value) {
                // Handle checkbox change
              },
            ),
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  S.of(context).rememberMe,
                  style: AppTextStyles.fourteen.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
