/*import 'package:flutter/material.dart';


class AnimatedToggleDemo extends StatefulWidget {
  @override
  _AnimatedToggleDemoState createState() => _AnimatedToggleDemoState();
}

class _AnimatedToggleDemoState extends State<AnimatedToggleDemo> {
  bool isRegisterSelected = true; // Default first container selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Animated Toggle Containers'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(25),
          ),
          padding: EdgeInsets.all(4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
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
                            )
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
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: !isRegisterSelected ? Colors.brown : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: !isRegisterSelected
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            )
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
        ),
      ),
    );
  }
}

// Alternative approach using a custom widget for reusability
class AnimatedToggleButton extends StatefulWidget {
  final String firstOption;
  final String secondOption;
  final Function(int) onSelectionChanged;
  final Color selectedColor;
  final Color unselectedColor;
  final Color backgroundColor;

  const AnimatedToggleButton({
    Key? key,
    required this.firstOption,
    required this.secondOption,
    required this.onSelectionChanged,
    this.selectedColor = Colors.brown,
    this.unselectedColor = Colors.brown,
    this.backgroundColor = Colors.grey,
  }) : super(key: key);

  @override
  _AnimatedToggleButtonState createState() => _AnimatedToggleButtonState();
}

class _AnimatedToggleButtonState extends State<AnimatedToggleButton> {
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
                  )
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

// Usage example of the custom widget
class CustomToggleExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedToggleButton(
          firstOption: 'Register',
          secondOption: 'Login',
          selectedColor: Colors.brown,
          unselectedColor: Colors.brown,
          backgroundColor: Colors.grey,
          onSelectionChanged: (index) {
            print('Selected: ${index == 0 ? 'Register' : 'Login'}');
          },
        ),
      ),
    );
  }
}*/

import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/core/utils/testing/testing_row.dart';
import 'package:circles/features/settings/switch_theme/presentation/view/switch_theme_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TestFile extends StatelessWidget {
  const TestFile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SwitchThemeButton(),
              Text("Hello wrold ", style: AppTextStyles.regular)
            ],
          ),
        ),
      ),
    );
  }
}