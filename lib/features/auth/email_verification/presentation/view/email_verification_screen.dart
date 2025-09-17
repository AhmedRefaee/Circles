import 'package:circles/core/config/themes/app_spacing.dart';
import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/core/utils/elements/back_arrow_button.dart';
import 'package:circles/features/auth/email_verification/presentation/view/widgets/email_verification_form.dart';
import 'package:circles/features/auth/email_verification/presentation/view/widgets/resend_button.dart';
import 'package:circles/features/auth/email_verification/presentation/view/widgets/verify_button.dart';
import 'package:circles/features/auth/email_verification/presentation/view_model/email_verification_cubit/email_verification_cubit.dart';
import 'package:circles/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EmailVerificationCubit(),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(leading: BackArrowButton()),
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenHorizontal,
                  vertical: AppSpacing.screenVertical,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).enterVerificationCode,
                        style: AppTextStyles.headline2,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 21,
                      ),

                      RichText(
                        text: TextSpan(
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium, // Use theme style
                          children: [
                            TextSpan(
                              text: S.of(context).verificationCodeInstruction,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            TextSpan(
                              text: email,
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight
                                        .bold, // Add emphasis if needed
                                  ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppSpacing.verticalXXLarge),

                      EmailVerificationForm(),
                      SizedBox(height: AppSpacing.verticalXXLarge),
                      ResendButton(),
                      SizedBox(height: AppSpacing.verticalXXLarge),
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(horizontal: 30.w),
                        child: const VerifyButton(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
