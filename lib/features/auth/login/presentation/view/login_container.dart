import 'package:circles/core/config/themes/app_spacing.dart';
import 'package:circles/core/utils/elements/themed_expansion_tile.dart';
import 'package:circles/features/auth/login/presentation/view/widgets/forgot_password_button.dart';
import 'package:circles/features/auth/login/presentation/view/widgets/login_button.dart';
import 'package:circles/features/auth/login/presentation/view/widgets/login_form.dart';
import 'package:circles/features/auth/login/presentation/view/widgets/remmeber_me_check.dart';
import 'package:circles/features/auth/login/presentation/view/widgets/rather_register_button.dart';
import 'package:circles/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({super.key});

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ThemedExpansionTile(
          title: S.of(context).loginWithEmail,
          children: [
            LoginForm(
              emailController: _emailController,
              passwordController: _passwordController,
            ),
            SizedBox(height: AppSpacing.verticalLarge),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [RememberMeCheck(), ForgotPasswordButton()],
            ),
            SizedBox(height: AppSpacing.verticalLarge),

            LoginButton(
              emailController: _emailController,
              passwordController: _passwordController,
            ),
          ],
        ),
        SizedBox(height: AppSpacing.verticalLarge),
        RatherRegisterButton(),
      ],
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
