import 'package:circles/core/config/themes/app_colors.dart';
import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/features/auth/new_password/presentation/views/widgets/new_password_form.dart';
import 'package:circles/features/auth/new_password/presentation/views/widgets/password_conditions.dart';
import 'package:circles/features/auth/new_password/presentation/views/widgets/password_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordFormContainer extends StatefulWidget {
  final Function(String) onSubmitPassword;
  final String email;

  const PasswordFormContainer({
    super.key,
    required this.onSubmitPassword,
    required this.email,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PasswordFormContainerState createState() => _PasswordFormContainerState();
}

class _PasswordFormContainerState extends State<PasswordFormContainer> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final PasswordValidator _validator = PasswordValidator();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _confirmPasswordFocusNode = FocusNode();

  bool _isButtonEnabled = false;
  bool _isLoading = false;
  String? _errorMessage;
  bool _showError = false;
  bool _isPasswordFieldFocused = false;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_updateButtonState);
    _confirmPasswordController.addListener(_updateButtonState);

    // Listen for focus changes on both fields
    _passwordFocusNode.addListener(_handleFocusChange);
    _confirmPasswordFocusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    setState(() {
      _isPasswordFieldFocused =
          _passwordFocusNode.hasFocus || _confirmPasswordFocusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _passwordController.removeListener(_updateButtonState);
    _confirmPasswordController.removeListener(_updateButtonState);
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    _passwordFocusNode.removeListener(_handleFocusChange);
    _confirmPasswordFocusNode.removeListener(_handleFocusChange);
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();

    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      // Update validation states
      _validator.validatePassword(
        _passwordController.text,
        _confirmPasswordController.text,
      );

      _isButtonEnabled = _passwordController.text.isNotEmpty;

      // Hide error message if all conditions are met
      if (_validator.allConditionsMet()) {
        _showError = false;
        _errorMessage = null;
      }
    });
  }

  void _submitPassword() {
    setState(() {
      _showError = true;
    });

    // Get appropriate error message based on validation results
    _errorMessage = _validator.getErrorMessage();

    // If all validations pass, proceed with submission
    if (_errorMessage == null) {
      setState(() {
        _isLoading = true;
      });

      // Use cubit to make the API call
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive sizing
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: screenHeight * 0.15,
          width: screenWidth * 0.85,
          child: NewPassForm(
            passwordController: _passwordController,
            confirmPasswordController: _confirmPasswordController,
            passwordFocusNode: _passwordFocusNode,
            confirmPasswordFocusNode: _confirmPasswordFocusNode,

          ),
        ),
        SizedBox(height: 20.h),

        // Password requirements widget
        if (_isPasswordFieldFocused &&
            _passwordController.text.isNotEmpty &&
            !_validator.allConditionsMet())
          PasswordConditios(
            screenWidth: screenWidth,
            hasLowercase: _validator.hasLowercase,
            hasUppercase: _validator.hasUppercase,
            hasNumber: _validator.hasNumber,
            hasMinLength: _validator.hasMinLength,
            hasSpecialChar: _validator.hasSpecialChar,
            passwordsMatch: _validator.passwordsMatch,
          ),
        SizedBox(height: 20.h),
        ///////////////////////save button////////////////////
        SizedBox(
          height: screenHeight * 0.06,
          width: screenWidth * 0.5,
          child: ElevatedButton(
            onPressed: (_isLoading || !_isButtonEnabled)
                ? null
                : _submitPassword,
            child: _isLoading
                ? SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: CircularProgressIndicator(),
                  )
                : FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text("Save", style: AppTextStyles.regular),
                  ),
          ),
        ),
      ],
    );
  }
}
