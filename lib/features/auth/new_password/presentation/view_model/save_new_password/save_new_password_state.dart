part of 'save_new_password_cubit.dart';

@immutable
sealed class SaveNewPasswordState {}

final class SaveNewPasswordInitial extends SaveNewPasswordState {}

final class SaveNewPasswordSaving extends SaveNewPasswordState {}

final class SaveNewPasswordSaved extends SaveNewPasswordState {}

final class SaveNewPasswordError extends SaveNewPasswordState {
  final String message;

  SaveNewPasswordError(this.message);
}
