part of 'google_login_cubit.dart';

@immutable
sealed class GoogleLoginState {}

final class GoogleLoginInitial extends GoogleLoginState {}

final class GoogleLoginLoadingState extends GoogleLoginState {}

final class GoogleLoginSuccessState extends GoogleLoginState {}

final class GoogleLoginFailureState extends GoogleLoginState {
  final String errMessage;

  GoogleLoginFailureState({required this.errMessage});
}
