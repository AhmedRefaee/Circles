import 'package:circles/core/config/themes/app_icons.dart';
import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/core/utils/elements/back_arrow_button.dart';
import 'package:circles/core/utils/testing/test_file.dart';
import 'package:circles/features/auth/new_password/presentation/views/widgets/password_form_container.dart';
import 'package:circles/features/settings/switch_theme/presentation/view/switch_theme_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewPasswordPage extends StatelessWidget {
  final String email;

  const NewPasswordPage({super.key, required this.email});

  void _handlePasswordSubmit(BuildContext context, String password) {
    // After successful password reset, navigate to login page
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const TestFile()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SwitchThemeButton(),
                    IconButton(onPressed: () {}, icon: Icon(AppIcons.globe)),
                  ],
                ),

                BackArrowButton(),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Flexible(
                    child: Text(
                      "Set a New Password",
                      style: AppTextStyles.headline1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Flexible(
                    child: Text(
                      "Enter your new password to reset your account",
                      style: AppTextStyles.fourteen.copyWith(
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                Center(
                  child: PasswordFormContainer(
                    onSubmitPassword: (p0) => {},
                    email: email,
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
