import 'package:bloc/bloc.dart';
import 'package:circles/core/consts/random_consts.dart';
import 'package:meta/meta.dart';

part 'email_verification_state.dart';

class EmailVerificationCubit extends Cubit<EmailVerificationState> {
  EmailVerificationCubit() : super(EmailVerificationInitial());

  String _verificationCode = '';

  void updateVerificationCode(String code) {
    if (_verificationCode == code) return;
    _verificationCode = code;
    _emitValidationState();
  }

  void _emitValidationState() {
    final isCodeValid = _isCodeValid();
    final isFormValid = isCodeValid;

    final currentState = state;
    if (currentState is EmailVerificationValidation &&
        currentState.verificationCode == _verificationCode &&
        currentState.isCodeValid == isCodeValid &&
        currentState.isFormValid == isFormValid) {
      return;
    }

    emit(
      EmailVerificationValidation(
        verificationCode: _verificationCode,
        isCodeValid: isCodeValid,
        isFormValid: isFormValid,
      ),
    );
  }

  bool _isCodeValid() {
    return _verificationCode.length == RandomConsts.codeLength &&
        _verificationCode.contains(RegExp(r'^[0-9]+$'));
  }

  Future<void> verifyCode() async {
    final currentState = state;
    if (currentState is EmailVerificationValidation &&
        currentState.isFormValid) {
      emit(EmailVerificationLoading());

      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      // Emit success to trigger navigation
      emit(EmailVerificationSuccess());
    }
  }
}
