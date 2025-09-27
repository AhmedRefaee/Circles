import 'package:circles/core/config/themes/app_colors.dart';
import 'package:circles/core/config/themes/app_spacing.dart';
import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/features/auth/new_password/presentation/view_model/new_password/new_password_form_cubit.dart';
import 'package:circles/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordConditions extends StatelessWidget {
  const PasswordConditions({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = S.of(context);

    return BlocBuilder<NewPasswordFormCubit, NewPasswordFormState>(
      builder: (context, state) {
        if (state is! NewPasswordFormValidating) {
          return const SizedBox.shrink();
        }

        return Container(
          padding: EdgeInsets.symmetric(
            vertical: AppSpacing.verticalSmall,
            horizontal: AppSpacing.horizontalSmall,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? AppColors.lCirclesSecondary
                : AppColors.dCirclesPrimary,
            borderRadius: BorderRadius.circular(18.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 3,
                spreadRadius: 0.5,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.passwordRequirements,
                style: AppTextStyles.description.copyWith(fontSize: 13.sp),
              ),
              SizedBox(height: AppSpacing.verticalXSmall),
              _buildConditionRow(l10n.atLeastOneLowercase, state.hasLowercase),
              SizedBox(height: AppSpacing.verticalXSmall),
              _buildConditionRow(l10n.atLeastOneUppercase, state.hasUppercase),
              SizedBox(height: AppSpacing.verticalXSmall),
              _buildConditionRow(l10n.atLeastOneNumber, state.hasNumber),
              SizedBox(height: AppSpacing.verticalXSmall),
              _buildConditionRow(
                l10n.atLeastEightCharacters,
                state.hasMinLength,
              ),
              SizedBox(height: AppSpacing.verticalXSmall),
              _buildConditionRow(
                l10n.atLeastOneSpecialSymbol,
                state.hasSpecialChar,
              ),
              SizedBox(height: AppSpacing.verticalXSmall),
              _buildConditionRow(l10n.passwordsMatch, state.passwordsMatch),
            ],
          ),
        );
      },
    );
  }

  Widget _buildConditionRow(String text, bool condition) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          condition ? Icons.check_circle : Icons.cancel,
          color: condition
              ? AppColors.lCirclesSuccess
              : AppColors.lCirclesError,
          size: 16.sp,
        ),
        SizedBox(width: AppSpacing.horizontalXSmall),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.fourteen.copyWith(fontSize: 12.sp),
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
