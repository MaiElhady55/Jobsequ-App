part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterSuccessState extends RegisterState {
  final RegisterModel? registerModel;

  RegisterSuccessState({required this.registerModel});
}

final class RegisterFailureState extends RegisterState {
  final String? errMessage;

  RegisterFailureState({required this.errMessage});
}

class ChangeRememberState extends RegisterState {}

class ChangePasswordVisibilityState extends RegisterState {}

class ChangeTappedState extends RegisterState {}

class InterestedWorkState extends RegisterState {}

class DataSuccessfullyState extends RegisterState {}

class DataErrorState extends RegisterState {}

class DataLoadingState extends RegisterState {}

class SelectCountryState extends RegisterState {}

class ChangeIndexState extends RegisterState {}

class ChangeColorIndexState extends RegisterState {}
