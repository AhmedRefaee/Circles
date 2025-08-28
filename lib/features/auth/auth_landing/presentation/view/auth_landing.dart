import 'package:circles/core/config/themes/app_icons.dart';
import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/features/auth/auth_landing/presentation/view/widgets/or_divider.dart';
import 'package:circles/features/auth/auth_landing/presentation/view/widgets/register_or_login.dart';
import 'package:circles/features/auth/login/presentation/view/login_container.dart';
import 'package:circles/features/auth/register/presentation/view/register_container.dart';
import 'package:circles/features/auth/social_login/presentation/view/facebook_login_btn.dart';
import 'package:circles/features/auth/social_login/presentation/view/google_login_btn.dart';
import 'package:circles/features/settings/switch_theme/presentation/view/switch_theme_button.dart';
import 'package:circles/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AuthLanding extends StatelessWidget {
  const AuthLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SwitchThemeButton(),
                  IconButton(onPressed: () {}, icon: Icon(AppIcons.globe)),
                ],
              ),
              SizedBox(height: 20.h),
              SvgPicture.asset(
                "assets/images/logo/logo.svg",
                width: 100.w,
                height: 100.h,
              ),
              SizedBox(height: 20.h),
              Text(
                S.of(context).welcomeToCircles,
                style: AppTextStyles.headline2,
              ),
              SizedBox(height: 10.h),
              Text(
                S.of(context).authLanding,
                style: AppTextStyles.fourteen.copyWith(
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15.h),
              RegisterOrLogin(),
              SizedBox(height: 15.h),
              GoogleLoginBtn(),
              SizedBox(height: 15.h),
              FacebookLoginBtn(),
              SizedBox(height: 15.h),
              OrDivider(),  
              SizedBox(height: 15.h),

              /////// REGISTER OR LOGIN CONTAINER 
           //   RegisterContainer(),
           LoginContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}