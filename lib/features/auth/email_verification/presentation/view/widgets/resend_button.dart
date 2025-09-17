import 'package:circles/core/config/themes/app_colors.dart';
import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/generated/l10n.dart';
import 'package:flutter/material.dart';

class ResendButton extends StatelessWidget {
  const ResendButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).didNotReceiveCode, style: AppTextStyles.fourteen),

        GestureDetector(
          onTap: () {},
          child: Text(
            S.of(context).resend,
            style: AppTextStyles.fourteen.copyWith(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.lCircleaccent
                  : AppColors.dCircleaccent,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}
