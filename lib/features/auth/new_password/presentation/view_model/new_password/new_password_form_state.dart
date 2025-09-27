part of 'new_password_form_cubit.dart';

@immutable
sealed class NewPasswordFormState {}

final class NewPasswordFormInitial extends NewPasswordFormState {}

final class NewPasswordFormValidating extends NewPasswordFormState {
  final bool hasLowercase;
  final bool hasUppercase;
  final bool hasNumber;
  final bool hasMinLength;
  final bool hasSpecialChar;
  final bool passwordsMatch;

  NewPasswordFormValidating({
    required this.hasLowercase,
    required this.hasUppercase,
    required this.hasNumber,
    required this.hasMinLength,
    required this.hasSpecialChar,
    required this.passwordsMatch,
  });

  /// Encapsulates validation logic - follows SRP
  bool get isFormValid =>
      hasLowercase &&
      hasUppercase &&
      hasNumber &&
      hasMinLength &&
      hasSpecialChar &&
      passwordsMatch;
}
