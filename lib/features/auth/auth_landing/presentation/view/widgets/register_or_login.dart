import 'package:circles/core/config/themes/app_colors.dart';
import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/core/config/themes/theme_extensions/theme_extenstions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterOrLogin extends StatefulWidget {
  const RegisterOrLogin({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterOrLoginState createState() => _RegisterOrLoginState();
}

class _RegisterOrLoginState extends State<RegisterOrLogin> {
  bool isRegisterSelected = true; // Default first container selected

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.lCirclesSecondary
            : AppColors.dCirclesSecondary,
        borderRadius: BorderRadius.circular(50.r),
      ),
      padding: EdgeInsets.all(1),
      child: Row(
        children: [
          // Remove mainAxisAlignment: MainAxisAlignment.spaceAround
          // Register Container
          Expanded(
            // Add Expanded here
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isRegisterSelected = true;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  margin: EdgeInsets.only(
                    right: 5.w,
                  ), // Small gap between buttons
                  padding: EdgeInsets.symmetric(vertical: 0.h),
                  decoration: BoxDecoration(
                    color: isRegisterSelected
                        ? AppColors.lCirclesPrimary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Center(
                    // Center the text
                    child: AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 400),
                      style: AppTextStyles.headline3.copyWith(
                        color: isRegisterSelected ? Colors.white : Colors.black,
                      ),
                      child: Text('Register'),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Login Container
          Expanded(
            // Add Expanded here too
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isRegisterSelected = false;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  margin: EdgeInsets.only(left: 5.w),
                  padding: EdgeInsets.symmetric(vertical: 0.h),
                  decoration: BoxDecoration(
                    color: !isRegisterSelected
                        ? AppColors.lCirclesPrimary
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Center(
                    child: AnimatedDefaultTextStyle(
                      duration: Duration(milliseconds: 400),
                      style: AppTextStyles.headline3.copyWith(
                        color: !isRegisterSelected
                            ? Colors.white
                            : Colors.black, // Fix: was showing 'Register' text
                      ),
                      child: Text('Login'), // Fix: This should say 'Login'
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}





/*
// Alternative approach using a custom widget for reusability
class RegisterOrLoginButton extends StatefulWidget {
  final String firstOption;
  final String secondOption;
  final Function(int) onSelectionChanged;
  final Color selectedColor;
  final Color unselectedColor;
  final Color backgroundColor;

  const RegisterOrLoginButton({
    super.key,
    required this.firstOption,
    required this.secondOption,
    required this.onSelectionChanged,
    this.selectedColor = AppColors.lCirclesPrimary,
    this.unselectedColor = Colors.brown,
    this.backgroundColor = Colors.grey,
  });

  @override
  _RegisterOrLoginButtonState createState() => _RegisterOrLoginButtonState();
}

class _RegisterOrLoginButtonState extends State<RegisterOrLoginButton> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor.withOpacity(0.3),
        borderRadius: BorderRadius.circular(25),
      ),
      padding: EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildToggleOption(0, widget.firstOption),
          _buildToggleOption(1, widget.secondOption),
        ],
      ),
    );
  }

  Widget _buildToggleOption(int index, String text) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        widget.onSelectionChanged(index);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? widget.selectedColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ]
              : [],
        ),
        child: AnimatedDefaultTextStyle(
          duration: Duration(milliseconds: 300),
          style: TextStyle(
            color: isSelected ? Colors.white : widget.unselectedColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
*/