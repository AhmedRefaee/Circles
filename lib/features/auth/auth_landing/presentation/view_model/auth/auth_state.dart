part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class RegisterState extends AuthState {}

class LoginState extends AuthState {}
