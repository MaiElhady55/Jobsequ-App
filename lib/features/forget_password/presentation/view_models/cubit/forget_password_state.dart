part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

class ChangePasswordVisibilityState extends ForgetPasswordState {}

class ChangePasswordVisibilityConfirmState extends ForgetPasswordState {}
