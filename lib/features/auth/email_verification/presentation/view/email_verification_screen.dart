import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/core/utils/elements/back_arrow_button.dart';
import 'package:circles/features/auth/email_verification/presentation/view/widgets/email_verification_form.dart';
import 'package:circles/features/auth/email_verification/presentation/view/widgets/resend_button.dart';
import 'package:circles/features/auth/email_verification/presentation/view/widgets/verify_button.dart';
import 'package:circles/features/auth/email_verification/presentation/view_model/email_verification_cubit/email_verification_cubit.dart';
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
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    BackArrowButton(),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: Text(
                        "Enter Verification Code",
                        style: AppTextStyles.headline2,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 21,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: RichText(
                        text: TextSpan(
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium, // Use theme style
                          children: [
                            const TextSpan(
                              text:
                                  'Please enter the 4 digit code that has been sent to  ',
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
                    ),

                    Center(child: EmailVerificationForm()),
                    ResendButton(),
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
    );
  }
}
