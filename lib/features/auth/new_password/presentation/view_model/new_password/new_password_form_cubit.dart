import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'new_password_form_state.dart';

class NewPasswordFormCubit extends Cubit<NewPasswordFormState> {
  NewPasswordFormCubit() : super(NewPasswordFormInitial());

  void checkPasswords(String password, String confirmPassword) {
    final hasLowercase = RegExp(r'[a-z]').hasMatch(password);
    final hasUppercase = RegExp(r'[A-Z]').hasMatch(password);
    final hasNumber = RegExp(r'[0-9]').hasMatch(password);
    final hasMinLength = password.length >= 8;
    final hasSpecialChar = RegExp(
      r'[-+_!@#$%^&*(),.?":{}|<>]',
    ).hasMatch(password);
    final passwordsMatch =
        password == confirmPassword && confirmPassword.isNotEmpty;

    emit(
      NewPasswordFormValidating(
        hasLowercase: hasLowercase,
        hasUppercase: hasUppercase,
        hasNumber: hasNumber,
        hasMinLength: hasMinLength,
        hasSpecialChar: hasSpecialChar,
        passwordsMatch: passwordsMatch,
      ),
    );
  }

  void reset() {
    emit(NewPasswordFormInitial());
  }

  /// Validates password field - moved from PasswordFormValidator
  /// Returns null if valid, error message if invalid
  String? checkPasswordConditions(
    String? value, {
    required String pleaseEnterPassword,
    required String passwordMinLength,
    required String passwordNeedsLowercase,
    required String passwordNeedsUppercase,
    required String passwordNeedsNumber,
    required String passwordNeedsSpecialChar,
  }) {
    if (value == null || value.isEmpty) {
      return pleaseEnterPassword;
    }

    if (value.length < 8) {
      return passwordMinLength;
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return passwordNeedsLowercase;
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return passwordNeedsUppercase;
    }

    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return passwordNeedsNumber;
    }

    if (!RegExp(r'[-+_!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return passwordNeedsSpecialChar;
    }

    return null;
  }

  /// Validates confirm password field - moved from PasswordFormValidator
  /// Requires reference to original password for comparison
  String? checkConfirmPasswordConditions(
    String? value,
    String originalPassword, {
    required String pleaseConfirmPassword,
    required String passwordsDoNotMatch,
  }) {
    if (value == null || value.isEmpty) {
      return pleaseConfirmPassword;
    }

    if (value != originalPassword) {
      return passwordsDoNotMatch;
    }

    return null;
  }
}
