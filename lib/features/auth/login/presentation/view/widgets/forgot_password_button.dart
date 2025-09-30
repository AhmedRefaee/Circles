import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/core/helper/extenstions.dart';
import 'package:circles/core/routing/routes.dart';
import 'package:circles/features/auth/forgot_password/presentation/view/forgot_password_page.dart';
import 'package:circles/generated/l10n.dart';
import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextButton(
        onPressed: () {
          context.pushNamed(Routes.forgotPasswordPage);
        },
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            S.of(context).forgotPassword,
            style: AppTextStyles.fourteen,
          ),
        ),
      ),
    );
  }
}
