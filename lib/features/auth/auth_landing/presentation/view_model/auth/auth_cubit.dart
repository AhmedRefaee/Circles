import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(RegisterState()); // Default to Register

  void switchToRegister() {
    emit(RegisterState());
  }

  void switchToLogin() {
    emit(LoginState());
  }

  bool get isRegisterSelected => state is RegisterState;
  bool get isLoginSelected => state is LoginState;
}
