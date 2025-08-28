import 'package:circles/core/config/themes/app_text_styles.dart';
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
          SvgPicture.asset("assets/images/icons/facebook_icon.svg"),
          SizedBox(width: 10.w),
          Text("Continue with Facebook", style: AppTextStyles.regular),
        ],
      ),
    ); }
}