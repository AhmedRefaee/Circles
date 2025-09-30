import 'package:circles/core/config/themes/app_spacing.dart';
import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/core/helper/widgets/themed_expansion_tile.dart';
import 'package:circles/features/auth/register/presentation/view/widgets/rather_login_button.dart';
import 'package:circles/features/auth/register/presentation/view/widgets/register_button.dart';
import 'package:circles/features/auth/register/presentation/view/widgets/register_form.dart';
import 'package:circles/generated/l10n.dart';
import 'package:flutter/material.dart';

class RegisterContainer extends StatefulWidget {
  const RegisterContainer({super.key});

  @override
  State<RegisterContainer> createState() => _RegisterContainerState();
}

class _RegisterContainerState extends State<RegisterContainer> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ThemedExpansionTile(
          title: S.of(context).registerWithEmail,
          children: [
            // Register Form
            RegisterForm(
              emailController: _emailController,
              usernameController: _usernameController,
              passwordController: _passwordController,
            ),
            SizedBox(height: AppSpacing.verticalLarge),
            // Terms text
            Text(
              S.of(context).termsText,
              style: AppTextStyles.eleven,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSpacing.verticalLarge),
            // Register Button
            RegisterButton(
              emailController: _emailController,
              usernameController: _usernameController,
              passwordController: _passwordController,
            ),
          ],
        ),
        SizedBox(height: AppSpacing.verticalLarge),
        const RatherLoginButton(), // "Already have an account?"
      ],
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }
}
