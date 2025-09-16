import 'package:circles/core/config/themes/app_colors.dart';
import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResendButton extends StatelessWidget {
  const ResendButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 50.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Don't receive the code? ", style: AppTextStyles.fourteen),

          GestureDetector(
            onTap: () {},
            child: Text(
              "RESEND",
              style: AppTextStyles.fourteen.copyWith(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.lCircleaccent
                    : AppColors.dCircleaccent,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
