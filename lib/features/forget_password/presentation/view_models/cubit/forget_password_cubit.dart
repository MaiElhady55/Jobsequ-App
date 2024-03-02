import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
  static ForgetPasswordCubit get(context) => BlocProvider.of(context);
  String? password;
  int colorIndex = 0;
  int colorIndex1 = 0;
  String? errorText;
  String? errorText2;

  //Change Icon
  bool secirty = true;
  bool secirty2 = true;
  void ChangePasswordVisibility() {
    secirty = !secirty;
    emit(ChangePasswordVisibilityState());
  }

  void ChangePasswordVisibilityconfirm() {
    secirty2 = !secirty2;
    emit(ChangePasswordVisibilityConfirmState());
  }
}
