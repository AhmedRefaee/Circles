import 'package:circles/core/config/themes/app_spacing.dart';
import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/core/consts/app_assets.dart';
import 'package:circles/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class FacebookLoginBtn extends StatelessWidget {
  const FacebookLoginBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(50.r),
      ),
      height: 50.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.facebookIcon),
          SizedBox(width: AppSpacing.horizontalSmall),
          Text(
            S.of(context).continueWithFacebook,
            style: AppTextStyles.regular,
          ),
        ],
      ),
    );
  }
}
