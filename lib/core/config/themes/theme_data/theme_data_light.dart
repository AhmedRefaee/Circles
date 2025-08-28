import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circles/core/config/themes/app_colors.dart';
import 'package:circles/core/config/themes/app_fonts.dart';
import 'package:circles/core/config/themes/custom_theme_extension.dart';
import 'package:circles/core/config/themes/app_text_styles.dart';

ThemeData getlightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.lCirclesBackground,

    brightness: Brightness.light,

    fontFamily: AppFonts.firaSans,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.lCirclesPrimary,
      brightness: Brightness.light,
    ),

    extensions: [CustomColors.light],

    textTheme: ThemeData.light().textTheme.apply(
      fontFamily: AppFonts.firaSans,
      bodyColor: AppColors.lCirclesPrimary,
      displayColor: AppColors.lCirclesPrimary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lCirclesPrimary,
        foregroundColor: AppColors.lCirclesBackground,
        disabledBackgroundColor: AppColors.lCirclesPrimary.withOpacity(0.5),
        disabledForegroundColor: AppColors.lCirclesonBackground.withOpacity(
          0.5,
        ),
        minimumSize: Size(double.infinity, 48.h),
        textStyle: AppTextStyles.regular,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      labelStyle: AppTextStyles.fourteen.copyWith(
        color: AppColors.lCirclesPrimary.withAlpha(100),
      ),
      fillColor: AppColors.lCirclesGray.withAlpha(50),
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.r),
        borderSide: BorderSide(color: AppColors.lCirclesBackground),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.r),
        borderSide: BorderSide(color: AppColors.lCirclesPrimary.withAlpha(50)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.r),
        
        borderSide: BorderSide(color: AppColors.lCirclesPrimary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.r),
        borderSide: BorderSide(color: AppColors.lCirclesError),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.r),
        borderSide: BorderSide(color: AppColors.lCirclesError),
      ),
    ),

    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.lCirclesPrimary, 
      strokeWidth: 3.w,
    ),
  );
}
