import 'package:circles/core/config/themes/app_colors.dart';
import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/core/config/themes/theme_extensions/theme_extenstions.dart';
import 'package:circles/core/helper/consts/random_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class EmailVerificationTextField extends StatefulWidget {
  final int codeLength;
  final ValueChanged<String>? onCodeComplete;
  final ValueChanged<String>? onCodeChanged;
  final TextEditingController? verificationController;
  final bool hasError;

  const EmailVerificationTextField({
    super.key,
    this.codeLength = RandomConsts.codeLength,
    this.onCodeComplete,
    this.onCodeChanged,
    this.verificationController,
    this.hasError = false,
  });

  @override
  State<EmailVerificationTextField> createState() =>
      _EmailVerificationTextFieldState();
}

class _EmailVerificationTextFieldState
    extends State<EmailVerificationTextField> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = widget.verificationController ?? TextEditingController();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    if (widget.verificationController == null) {
      _controller.dispose();
    }
    _focusNode.dispose();
    super.dispose();
  }

  void _onChanged(String value) {
    widget.onCodeChanged?.call(value);
    if (value.length == widget.codeLength) {
      widget.onCodeComplete?.call(value);
    }
  }

  void _handleSubmission(String value) {
    if (value.length == widget.codeLength) {
      widget.onCodeComplete?.call(value);
    }
  }

  PinTheme _buildPinTheme(BuildContext context) {
    return PinTheme(
      width: 50.w,
      height: 50.h,
      textStyle: AppTextStyles.regular,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? AppColors.lCirclesGray.withAlpha(50)
            : AppColors.dCirclesGray,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.light
              ? AppColors.lCirclesPrimary
              : AppColors.lCirclesGray,
          width: 1.w,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final defaultTheme = _buildPinTheme(context);

    return Form(
      key: _formKey,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Pinput(
          length: widget.codeLength,
          controller: _controller,
          focusNode: _focusNode,
          defaultPinTheme: defaultTheme,
          hapticFeedbackType: HapticFeedbackType.lightImpact,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          pinContentAlignment: Alignment.center,
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.done,
          onCompleted: _handleSubmission,
          onChanged: _onChanged,

          //// ON FOCUS
          focusedPinTheme: defaultTheme.copyWith(
            decoration: defaultTheme.decoration!.copyWith(
              border: Border.all(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.lCirclesPrimary
                    : AppColors.dCirclesonBackground,
                width: 2.w,
              ),
            ),
          ),

          //// ON SUBMITTED
          submittedPinTheme: defaultTheme.copyWith(
            decoration: defaultTheme.decoration!.copyWith(
              color: Theme.of(context).brightness == Brightness.light
                  ? AppColors.lCirclesSecondary.withAlpha(150)
                  : AppColors.dCirclesSecondary.withAlpha(150),
              border: Border.all(
                color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.lCirclesPrimary
                    : AppColors.dCirclesSecondary,
                width: 1.w,
              ),
            ),
          ),

          //// ON ERROR
          errorPinTheme: defaultTheme.copyWith(
            decoration: defaultTheme.decoration!.copyWith(
              border: Border.all(color: context.colors.error, width: 2.w),
            ),
          ),
        ),
      ),
    );
  }
}
