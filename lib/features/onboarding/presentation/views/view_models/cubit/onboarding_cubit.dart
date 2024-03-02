import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  static OnboardingCubit get(context) => BlocProvider.of(context);

  final controller = PageController();
  bool isLast = false;
  void changePageView(int index) {
    if (index == 2) {
      isLast = true;
      emit(ChangePageViewState());
    } else {
      isLast = false;
      emit(ChangePageViewState());
    }
  }
}
