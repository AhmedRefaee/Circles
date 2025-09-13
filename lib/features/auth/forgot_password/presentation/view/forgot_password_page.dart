import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/core/utils/elements/back_arrow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackArrowButton(),
              SizedBox(height: 20.h),
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
                  textAlign: TextAlign.center,
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
                  onTapOutside: (event) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your email address',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Send Request Code"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
