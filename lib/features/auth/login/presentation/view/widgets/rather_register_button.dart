import 'package:circles/core/config/themes/app_colors.dart';
import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/features/auth/auth_landing/presentation/view_model/auth/auth_cubit.dart';
import 'package:circles/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RatherRegisterButton extends StatelessWidget {
  const RatherRegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).dontHaveAnAccount, style: AppTextStyles.fourteen),
        BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            final authCubit = context.read<AuthCubit>();
            return GestureDetector(
              onTap: () => authCubit.switchToRegister(),
              child: Text(
                S.of(context).registerNow,
                style: AppTextStyles.fourteen.copyWith(
                  color: Theme.of(context).brightness == Brightness.light
                      ? AppColors.lCircleaccent
                      : AppColors.dCircleaccent,
                  fontWeight: FontWeight.w900,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
