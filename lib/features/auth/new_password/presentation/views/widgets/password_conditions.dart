import 'package:circles/core/config/themes/app_colors.dart';
import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordConditios extends StatelessWidget {
  const PasswordConditios({
    super.key,
    required this.screenWidth,
    required bool hasLowercase,
    required bool hasUppercase,
    required bool hasNumber,
    required bool hasMinLength,
    required bool hasSpecialChar,
    required bool passwordsMatch,
  })  : _hasLowercase = hasLowercase,
        _hasUppercase = hasUppercase,
        _hasNumber = hasNumber,
        _hasMinLength = hasMinLength,
        _hasSpecialChar = hasSpecialChar,
        _passwordsMatch = passwordsMatch;

  final double screenWidth;
  final bool _hasLowercase;
  final bool _hasUppercase;
  final bool _hasNumber;
  final bool _hasMinLength;
  final bool _hasSpecialChar;
  final bool _passwordsMatch;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Container(
      width: screenWidth * 0.8,
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.012, 
        horizontal: screenWidth * 0.04
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.lCirclesSecondary
            : AppColors.dCirclesPrimary,
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Password must meet the following requirements:',
            style: AppTextStyles.description
          ),
          SizedBox(height: screenHeight * 0.012),
          _buildConditionRow('At least one lowercase letter', _hasLowercase),
          SizedBox(height: screenHeight * 0.006),
          _buildConditionRow('At least one uppercase letter', _hasUppercase),
          SizedBox(height: screenHeight * 0.006),
          _buildConditionRow('At least one number', _hasNumber),
          SizedBox(height: screenHeight * 0.006),
          _buildConditionRow('Be at least 8 characters', _hasMinLength),
          SizedBox(height: screenHeight * 0.006),
          _buildConditionRow('At least one special symbol (e.g. !@#\$%^&_+*)', _hasSpecialChar),
          SizedBox(height: screenHeight * 0.006),
          _buildConditionRow('Passwords match', _passwordsMatch),
        ],
      ),
    );
  }
  
  Widget _buildConditionRow(String text, bool condition) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          condition ? Icons.check_circle : Icons.cancel,
          color: condition ? AppColors.lCirclesSuccess : AppColors.lCirclesError,
          size: 20.sp,
        ),
        SizedBox(width: screenWidth * 0.02),
        Expanded(
          child: Text(
            text,
            style: AppTextStyles.fourteen,
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
