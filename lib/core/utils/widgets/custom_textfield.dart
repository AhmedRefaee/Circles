import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:circles/core/config/themes/app_text_styles.dart';
import 'package:circles/core/config/themes/theme_extensions/theme_extenstions.dart';

enum ValidationState { none, valid, invalid }

class CustomTextfield extends StatefulWidget {
  final String label;
  final String? hint;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onFieldSubmitted;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final bool obscureText;
  final bool enableVisibilityToggle;
  final ValidationState validationState;
  final Widget? prefixIcon;
  final FocusNode? focusNode;

  const CustomTextfield({
    super.key,
    required this.label,
    this.hint,
    this.validator,
    this.controller,
    this.onChanged,
    this.onFieldSubmitted,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.enableVisibilityToggle = false,
    this.validationState = ValidationState.none,
    this.prefixIcon,
    this.focusNode,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  late bool _obscured;

  @override
  void initState() {
    super.initState();
    _obscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        controller: widget.controller,
        validator: widget.validator,
        style: AppTextStyles.fourteen,
        keyboardType: widget.keyboardType,
        textInputAction: widget.textInputAction,
        focusNode: widget.focusNode,
        obscureText: widget.enableVisibilityToggle
            ? _obscured
            : widget.obscureText,
        onChanged: widget.onChanged,
        onFieldSubmitted: (_) => widget.onFieldSubmitted?.call(),
        decoration: InputDecoration(
          labelText: widget.label,
          hintText: widget.hint,
          prefixIcon: widget.prefixIcon,
          suffixIcon: _buildSuffixIcons(),
        ),
      ),
    );
  }

  Widget? _buildSuffixIcons() {
    final icons = <Widget>[];

    if (widget.enableVisibilityToggle) {
      icons.add(
        IconButton(
          icon: Icon(
            _obscured ? Icons.visibility : Icons.visibility_off,
            size: 20.sp,
          ),
          onPressed: () {
            setState(() {
              _obscured = !_obscured;
            });
          },
        ),
      );
    }

    if (widget.validationState != ValidationState.none) {
      icons.add(
        Icon(
          widget.validationState == ValidationState.valid
              ? Icons.check
              : Icons.close,
          size: 20.sp,
          color: widget.validationState == ValidationState.valid
              ? context.colors.success
              : context.colors.error,
        ),
      );
    }

    return icons.isEmpty
        ? null
        : icons.length == 1
            ? icons.first
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: icons,
              );
  }
}
