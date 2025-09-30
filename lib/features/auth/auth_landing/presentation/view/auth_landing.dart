import 'package:circles/core/config/themes/app_icons.dart';
import 'package:circles/core/config/themes/app_spacing.dart';
import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/core/helper/consts/app_assets.dart';
import 'package:circles/features/auth/auth_landing/presentation/view/widgets/or_divider.dart';
import 'package:circles/features/auth/auth_landing/presentation/view/widgets/register_or_login.dart';
import 'package:circles/features/auth/auth_landing/presentation/view_model/auth/auth_cubit.dart';
import 'package:circles/features/auth/login/presentation/view/login_container.dart';
import 'package:circles/features/auth/register/presentation/view/register_container.dart';
import 'package:circles/features/auth/social_login/presentation/view/facebook_login_btn.dart';
import 'package:circles/features/auth/social_login/presentation/view/google_login_btn.dart';
import 'package:circles/features/settings/switch_locale/presentation/view/switch_locale_button.dart';
import 'package:circles/features/settings/switch_theme/presentation/view/switch_theme_button.dart';
import 'package:circles/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AuthLanding extends StatelessWidget {
  const AuthLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.screenHorizontal,
                vertical: AppSpacing.screenVertical,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //theme button
                      SwitchThemeButton(),
                      //language button
                      SwitchLocaleButton(),
                    ],
                  ),
                  SizedBox(height: AppSpacing.verticalLarge),
                  //logo
                  SvgPicture.asset(AppAssets.logo, width: 100.w, height: 100.h),
                  SizedBox(height: AppSpacing.verticalLarge),
                  //welcome text
                  Text(
                    S.of(context).welcomeToCircles,
                    style: AppTextStyles.headline2,
                  ),
                  SizedBox(height: AppSpacing.verticalSmall),
                  //description text
                  Text(
                    S.of(context).authLanding,
                    style: AppTextStyles.fourteen,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppSpacing.verticalMedium),
                  //register or login switcher
                  RegisterOrLogin(),
                  SizedBox(height: AppSpacing.verticalMedium),
                  //social login button
                  GoogleLoginBtn(),
                  SizedBox(height: AppSpacing.verticalMedium),
                  //social login button
                  FacebookLoginBtn(),
                  SizedBox(height: AppSpacing.verticalMedium),
                  //or divider
                  OrDivider(),
                  SizedBox(height: AppSpacing.verticalMedium),

                  // Dynamic container that switches based on state Login/Register
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      if (state is RegisterState) {
                        return RegisterContainer();
                      } else {
                        return LoginContainer();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
