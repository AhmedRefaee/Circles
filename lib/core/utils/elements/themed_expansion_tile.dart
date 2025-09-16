import 'package:circles/core/config/themes/app_colors.dart';
import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ThemedExpansionTile extends StatelessWidget {
  final String title;
  final List<Widget> children;
  final bool showDivider;
  final EdgeInsets? childrenPadding;
  final bool initiallyExpanded;

  const ThemedExpansionTile({
    super.key,
    required this.title,
    required this.children,
    this.showDivider = true,
    this.childrenPadding,
    this.initiallyExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.lCirclesGray),
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent, // Removes default divider
        ),
        child: ExpansionTile(
          title: Text(title, style: AppTextStyles.regular),
          initiallyExpanded: initiallyExpanded,
          childrenPadding:
              childrenPadding ?? EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
          shape: _borderShape,
          collapsedShape: _borderShape,
          backgroundColor: _getBackgroundColor(isDark),
          collapsedBackgroundColor: _getBackgroundColor(isDark),
          iconColor: _getIconColor(isDark),
          collapsedIconColor: _getIconColor(isDark),
          children: [
            if (showDivider) ...[
              Divider(height: 1, color: _getDividerColor(isDark)),
              SizedBox(height: 20.h),
            ],
            ...children,
          ],
        ),
      ),
    );
  }

  // Helper methods for styling
  RoundedRectangleBorder get _borderShape =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.r));

  Color _getBackgroundColor(bool isDark) {
    return isDark
        ? AppColors.dCirclesGray.withAlpha(100)
        : AppColors.lCirclesGray.withAlpha(50);
  }

  Color _getIconColor(bool isDark) {
    return isDark ? AppColors.dCirclesSecondary : AppColors.lCirclesPrimary;
  }

  Color _getDividerColor(bool isDark) {
    return isDark ? AppColors.dCirclesSecondary : AppColors.lCirclesPrimary;
  }
}
