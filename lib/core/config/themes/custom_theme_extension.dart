import 'package:flutter/material.dart';
import 'package:circles/core/config/themes/app_colors.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color primary;
  final Color onPrimary;
  final Color secondary;
  final Color error;
  final Color success;
  final Color background;
  final Color surface;
  final Color onSurface;

  const CustomColors({
    required this.primary,
    required this.onPrimary,
    required this.secondary,
    required this.error,
    required this.success,
    required this.background,
    required this.surface,
    required this.onSurface,
  });

  static const light = CustomColors(
    primary: AppColors.lCirclesPrimary,
    onPrimary: AppColors.lCirclesBackground,
    secondary: AppColors.lCirclesSecondary,
    error: AppColors.lCirclesError,   
    success: AppColors.lCirclesSuccess,
    background: AppColors.lCirclesBackground,
    surface: AppColors.lCirclesonBackground,
    onSurface: AppColors.lCirclesonBackground,
  );

  static const dark = CustomColors(
    primary: AppColors.dCirclesPrimary,
    onPrimary: AppColors.dCirclesonBackground,
    secondary: AppColors.dCirclesGray,
    error: AppColors.dCirclesError,
    success: AppColors.dCirclesSuccess,
    background: AppColors.dCirclesBackground,
    surface: AppColors.dCirclesBackground,
    onSurface: AppColors.dCirclesonBackground,
  );

  @override
  CustomColors copyWith({
    Color? primary,
    Color? onPrimary,
    Color? secondary,
    Color? error,
    Color? success,
    Color? background,
    Color? surface,
    Color? onSurface,
  }) {
    return CustomColors(
      primary: primary ?? this.primary,
      onPrimary: onPrimary ?? this.onPrimary,
      secondary: secondary ?? this.secondary,
      error: error ?? this.error,
      success: success ?? this.success,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      onSurface: onSurface ?? this.onSurface,
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      error: Color.lerp(error, other.error, t)!,
      success: Color.lerp(success, other.success, t)!,
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      onSurface: Color.lerp(onSurface, other.onSurface, t)!,
    );
  }
} 