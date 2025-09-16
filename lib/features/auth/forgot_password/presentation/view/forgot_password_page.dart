import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/core/utils/elements/back_arrow_button.dart';
import 'package:circles/features/auth/email_verification/presentation/view/email_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                BackArrowButton(),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),

                  child: Text(
                    "Forgot Password",
                    style: AppTextStyles.headline2,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 10.w),

                  child: Text(
                    "Please, enter your email address. You will receive a link to create a new password via email.",
                    style: AppTextStyles.fourteen.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    textAlign: TextAlign.left,
                  ),
                ),

                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 15.w),
                  child: Text("Email Address", style: AppTextStyles.regular),
                ),
                SizedBox(height: 10.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: TextFormField(
                    controller: _emailController,
                    onTapOutside: (event) {
                      FocusScope.of(context).unfocus();
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your email address',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(height: 50.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.w),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EmailVerificationScreen(
                            email: _emailController.text,
                          ),
                        ),
                      );
                    },
                    child: Text("Send Request Code"),
                  ),
                ),
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
