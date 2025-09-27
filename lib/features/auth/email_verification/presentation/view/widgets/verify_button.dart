import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/features/auth/email_verification/presentation/view_model/email_verification_cubit/email_verification_cubit.dart';
import 'package:circles/features/auth/new_password/presentation/views/new_password_page.dart';
import 'package:circles/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyButton extends StatelessWidget {
  final String email;

  const VerifyButton({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<EmailVerificationCubit>();

    return BlocListener<EmailVerificationCubit, EmailVerificationState>(
      listener: (context, state) {
        if (state is EmailVerificationSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewPasswordPage(email: email),
            ),
          );
        }
      },
      child: BlocBuilder<EmailVerificationCubit, EmailVerificationState>(
        buildWhen: (previous, current) {
          if (previous is EmailVerificationValidation &&
              current is EmailVerificationValidation) {
            return previous.isFormValid != current.isFormValid;
          }
          return current is EmailVerificationValidation;
        },
        builder: (context, state) {
          return ElevatedButton(
            onPressed: _isFormValid(state) ? cubit.verifyCode : null,
            child: Text(S.of(context).verifyCode, style: AppTextStyles.regular),
          );
        },
      ),
    );
  }

  bool _isFormValid(EmailVerificationState state) {
    return state is EmailVerificationValidation && state.isFormValid;
  }
}
