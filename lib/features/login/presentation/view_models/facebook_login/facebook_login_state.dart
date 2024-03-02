part of 'facebook_login_cubit.dart';

@immutable
sealed class FacebookLoginState {}

final class FacebookLoginInitial extends FacebookLoginState {}

final class FacebookLogLoadingState extends FacebookLoginState {}

final class FacebookLogSuccessState extends FacebookLoginState {}

final class FacebookLogFailureState extends FacebookLoginState {
  final String errMessage;

  FacebookLogFailureState({required this.errMessage});
}
