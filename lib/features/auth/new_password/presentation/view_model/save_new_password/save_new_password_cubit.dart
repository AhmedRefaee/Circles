import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'save_new_password_state.dart';

class SaveNewPasswordCubit extends Cubit<SaveNewPasswordState> {
  SaveNewPasswordCubit() : super(SaveNewPasswordInitial());

  /// Saves new password to backend - moved from NewPasswordFormCubit
  Future<void> saveNewPassword(String password, String email) async {
    try {
      emit(SaveNewPasswordSaving());

      // TODO: Implement actual API call to save new password
      // Example: await authRepository.saveNewPassword(password, email);

      // Simulate API call
      await Future.delayed(const Duration(seconds: 2));

      // For now, simulate success
      emit(SaveNewPasswordSaved());
    } catch (e) {
      emit(SaveNewPasswordError(e.toString()));
    }
  }

  /// Executes the save password action - moved from NewPasswordFormCubit
  /// Modified to accept boolean instead of GlobalKey for better separation
  void executePasswordSave(bool isFormValid, String password, String email) {
    if (isFormValid) {
      saveNewPassword(password, email);
    }
  }

  /// Checks if the save action can be executed - moved from NewPasswordFormCubit
  /// Modified to check current save state instead of form validation state
  bool canExecuteSave() {
    final currentState = state;
    return currentState is! SaveNewPasswordSaving;
  }

  void reset() {
    emit(SaveNewPasswordInitial());
  }
}
