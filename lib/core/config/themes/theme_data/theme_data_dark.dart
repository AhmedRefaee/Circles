import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circles/core/config/themes/app_colors.dart';
import 'package:circles/core/config/themes/app_fonts.dart';
import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/core/config/themes/custom_theme_extension.dart';

ThemeData getdarkTheme(){
return ThemeData(
    scaffoldBackgroundColor: AppColors.dCirclesBackground,

    brightness: Brightness.dark,

    fontFamily: AppFonts.firaSans,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.dCirclesPrimary,
      brightness: Brightness.dark,
    ),

    extensions: [
      CustomColors.dark,
    ],

    textTheme: ThemeData.dark().textTheme.apply(
      fontFamily: AppFonts.firaSans,
      bodyColor: AppColors.dCirclesonBackground,
      displayColor: AppColors.dCirclesonBackground,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.dCirclesSecondary,
        foregroundColor: AppColors.dCirclesPrimary,
        disabledBackgroundColor: AppColors.dCirclesSecondary.withOpacity(0.5),
        disabledForegroundColor: AppColors.dCirclesPrimary.withOpacity(0.5),
        minimumSize: Size(double.infinity, 48.h),
        textStyle: AppTextStyles.fourteen,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.r)),
      ),
    ),

   inputDecorationTheme: InputDecorationTheme(
      labelStyle: AppTextStyles.fourteen.copyWith(
        color: AppColors.dCirclesSecondary.withAlpha(150),
      ),
      fillColor: AppColors.dCirclesGray,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.r),
        borderSide: BorderSide(color: AppColors.dCirclesSecondary.withAlpha(100)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.r),
        borderSide: BorderSide(color: AppColors.dCirclesSecondary.withAlpha(100)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.r),
        
        borderSide: BorderSide(color: AppColors.dCirclesSecondary),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.r),
        borderSide: BorderSide(color: AppColors.dCirclesError),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.r),
        borderSide: BorderSide(color: AppColors.lCirclesError),
      ),
    ),


    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.dCirclesSecondary,
      strokeWidth: 3.w,
    ),
   );}