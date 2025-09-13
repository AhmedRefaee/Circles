part of 'email_verification_cubit.dart';

@immutable
sealed class EmailVerificationState {}

final class EmailVerificationInitial extends EmailVerificationState {}

final class EmailVerificationValidation extends EmailVerificationState {
  final String verificationCode;
  final bool isCodeValid;
  final bool isFormValid;

  EmailVerificationValidation({
    required this.verificationCode,
    required this.isCodeValid,
    required this.isFormValid,
  });
}

final class EmailVerificationLoading extends EmailVerificationState {}

final class EmailVerificationSuccess extends EmailVerificationState {}

final class EmailVerificationError extends EmailVerificationState {
  final String message;

  EmailVerificationError({required this.message});
} 