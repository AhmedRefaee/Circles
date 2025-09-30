import 'package:circles/core/config/themes/app_spacing.dart';
import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/core/helper/widgets/back_arrow_button.dart';
import 'package:circles/features/auth/forgot_password/presentation/view/widgets/request_code_button.dart';
import 'package:circles/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(leading: BackArrowButton()),
      body: SafeArea(
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
                /// Title Text
                Text(
                  S.of(context).forgotPassword,
                  style: AppTextStyles.headline2,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),

                //email instruction text
                Text(
                  S.of(context).passwordResetInstruction,
                  style: AppTextStyles.fourteen.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  //    textAlign: TextAlign.left,
                ),
                SizedBox(height: AppSpacing.verticalLarge),
                // Email Label
                Text(S.of(context).emailAddress, style: AppTextStyles.regular),
                SizedBox(height: AppSpacing.verticalSmall),
                // Email Field
                SizedBox(
                  height: 50.h,
                  child: TextFormField(
                    controller: _emailController, // Use the passed controller
                    keyboardType: TextInputType.emailAddress,
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                      hintText: S.of(context).enterEmailAddressPlaceholder,
                    ),
                  ),
                ),
                SizedBox(height: AppSpacing.verticalFifty),

                // Send Request Code Button
                RequestCodeButton(emailController: _emailController),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
