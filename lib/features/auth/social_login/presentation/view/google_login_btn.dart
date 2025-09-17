import 'package:circles/core/config/themes/app_spacing.dart';
import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/core/consts/app_assets.dart';
import 'package:circles/core/utils/testing/test_file.dart';
import 'package:circles/features/auth/social_login/data/service/google_signin_api.dart';
import 'package:circles/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class GoogleLoginBtn extends StatelessWidget {
  const GoogleLoginBtn({super.key});

  Future signIn(BuildContext context) async {
    final user = await GoogleSigninApi.login();

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Sign in failed, please try again.")),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => SocialAccInfo(user: user)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => signIn(context),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5),
          borderRadius: BorderRadius.circular(50.r),
        ),
        height: 50.h,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.gooleIcon),
            SizedBox(width: AppSpacing.horizontalSmall),
            Text(
              S.of(context).continueWithGoogle,
              style: AppTextStyles.regular,
            ),
          ],
        ),
      ),
    );
  }
}
