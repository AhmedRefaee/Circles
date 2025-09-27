import 'package:circles/core/config/themes/app_spacing.dart';
import 'package:circles/generated/l10n.dart';
import 'package:circles/features/auth/new_password/presentation/views/widgets/password_text_field.dart';
import 'package:circles/features/auth/new_password/presentation/view_model/new_password/new_password_form_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Pure UI Component for Password Form - follows Single Responsibility Principle
/// Only responsible for layout and composition of form fields
class NewPassForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final FocusNode passwordFocusNode;
  final FocusNode confirmPasswordFocusNode;

  const NewPassForm({
    super.key,
    required this.formKey,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.passwordFocusNode,
    required this.confirmPasswordFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return Form(
      key: formKey,
      child: Column(
        children: [
          PasswordTextField(
            labelText: l10n.newPassword,
            hintText: l10n.enterNewPasswordPlaceholder,
            controller: passwordController,
            focusNode: passwordFocusNode,
            validator: (value) =>
                context.read<NewPasswordFormCubit>().checkPasswordConditions(
                  value,
                  pleaseEnterPassword: l10n.pleaseEnterPassword,
                  passwordMinLength: l10n.passwordMinLength,
                  passwordNeedsLowercase: l10n.passwordNeedsLowercase,
                  passwordNeedsUppercase: l10n.passwordNeedsUppercase,
                  passwordNeedsNumber: l10n.passwordNeedsNumber,
                  passwordNeedsSpecialChar: l10n.passwordNeedsSpecialChar,
                ),
            onTapOutside: () => FocusScope.of(context).unfocus(),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (value) {
              FocusScope.of(context).requestFocus(confirmPasswordFocusNode);
            },
          ),
          SizedBox(height: AppSpacing.verticalSmall),
          PasswordTextField(
            labelText: l10n.confirmPassword,
            hintText: l10n.enterConfirmPasswordPlaceholder,
            controller: confirmPasswordController,
            focusNode: confirmPasswordFocusNode,
            validator: (value) => context
                .read<NewPasswordFormCubit>()
                .checkConfirmPasswordConditions(
                  value,
                  passwordController.text,
                  pleaseConfirmPassword: l10n.pleaseConfirmPassword,
                  passwordsDoNotMatch: l10n.passwordsDoNotMatch,
                ),
            onTapOutside: () => FocusScope.of(context).unfocus(),
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}
