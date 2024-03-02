part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoadingState extends LoginState {}

final class LoginSuccessState extends LoginState {
  final LoginModel loginModel;

  LoginSuccessState({required this.loginModel});
}

final class LoginFailureState extends LoginState {
  final String errMessage;

  LoginFailureState({required this.errMessage});
}

class ChangeRememberState extends LoginState {}

class ChangePasswordVisibilityState extends LoginState {}
