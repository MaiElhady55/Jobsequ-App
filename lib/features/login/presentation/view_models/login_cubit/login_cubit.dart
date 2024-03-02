import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/network/remote/dio_helper.dart';
import 'package:jobsque/core/network/remote/endpoints.dart';
import 'package:jobsque/features/login/data/models/login_model/login_model.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> loginUser({
    required String email,
    required String passsword,
  }) async {
    emit(LoginLoadingState());
    try {
      Response response = await DioHelper.postData(
          data: {'email': email, 'password': passsword}, endPoint: login);
      if (response.statusCode == 200) {
        LoginModel loginModel = LoginModel.fromJson(response.data);
        print('IIIID ${loginModel.user?.id}');
        emit(LoginSuccessState(loginModel: loginModel));
      }
    } catch (e) {
      emit(LoginFailureState(errMessage: e.toString()));
    }
  }

//Change Icon
  bool secirty = true;
  void ChangePasswordVisibility() {
    secirty = !secirty;
    emit(ChangePasswordVisibilityState());
  }

//Change checkBox
  bool isChecked = false;
  void changeCheckBox(checked) {
    isChecked = checked;
    emit(ChangeRememberState());
  }
}
