import 'package:circles/core/config/themes/app_spacing.dart';
import 'package:circles/features/auth/email_verification/presentation/view/email_verification_screen.dart';
import 'package:circles/generated/l10n.dart';
import 'package:flutter/material.dart';

class RequestCodeButton extends StatelessWidget {
  const RequestCodeButton({
    super.key,
    required TextEditingController emailController,
  }) : _emailController = emailController;

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.horizontalFifty),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  EmailVerificationScreen(email: _emailController.text),
            ),
          );
        },
        child: Text(S.of(context).sendRequestCodeButton),
      ),
    );
  }
}
