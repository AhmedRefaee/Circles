import 'package:circles/core/config/themes/theme_extensions/theme_extenstions.dart';
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
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colors.secondary,
        borderRadius: BorderRadius.circular(25.r),
      ),
      padding: EdgeInsets.all(4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Register Container
          GestureDetector(
            onTap: () {
              setState(() {
                isRegisterSelected = true;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: isRegisterSelected ? Colors.brown : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                boxShadow: isRegisterSelected
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
                  color: isRegisterSelected ? Colors.white : Colors.brown,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                child: Text('Register'),
              ),
            ),
          ),
          // Login Container
          GestureDetector(
            onTap: () {
              setState(() {
                isRegisterSelected = false;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
             // padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              decoration: BoxDecoration(
                color: !isRegisterSelected ? Colors.brown : Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                boxShadow: !isRegisterSelected
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
                  color: !isRegisterSelected ? Colors.white : Colors.brown,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
                child: Text('Login'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
    this.selectedColor = Colors.brown,
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
