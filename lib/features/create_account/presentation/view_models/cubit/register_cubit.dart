import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/network/remote/dio_helper.dart';
import 'package:jobsque/core/network/remote/endpoints.dart';
import 'package:jobsque/features/create_account/data/models/register_model/register_model.dart';
import 'package:meta/meta.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);
  RegisterModel? registerModel;
  Future<void> registerUser({
    required String email,
    required String userName,
    required String passsword,
  }) async {
    emit(RegisterLoadingState());
    try {
      Response response = await DioHelper.postData(
          data: {'name': userName, 'email': email, 'password': passsword},
          endPoint: register);
      if (response.statusCode == 200) {
        registerModel = RegisterModel.fromJson(response.data);
        emit(RegisterSuccessState(registerModel: registerModel));
      }
    } catch (e) {
      emit(RegisterFailureState(errMessage: e.toString()));
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

//List Of Intrested Work
  List<String> interestedWork = [];

  void addItem(String work) {
    interestedWork.add(work);
    emit(InterestedWorkState());
  }

  void deleteItem(String work) {
    interestedWork.remove(work);
    emit(InterestedWorkState());
  }

//List of Countries
  List<String> selectedCountries = [];

  void addItemCountry(String country) {
    selectedCountries.add(country);
    emit(SelectCountryState());
  }

  void deleteItemCountry(String country) {
    selectedCountries.remove(country);
    emit(SelectCountryState());
  }

  //Change color ot error text
  int colorIndex = 0;
  changeColorIndex(index) {
    colorIndex = index;
    emit(ChangeColorIndexState());
  }

//index of tabBar for Works
  int activeIndex = 0;
  changeIndex(index) {
    activeIndex = index;
    emit(ChangeIndexState());
  }

  void userDataSetup() {
    emit(DataLoadingState());
    DioHelper.puttData(
      endPoint: editProfile,
      data: {
        'interested_work': interestedWork.join(","),
        'offline_place': (activeIndex == 0).toString(),
        'remote_place': (activeIndex == 1).toString(),
        'address': selectedCountries.join(",")
      },
      token: registerModel?.token,
    ).then((value) {
      print(value.data);
      emit(DataSuccessfullyState());
    }).catchError((error) {
      print(error.toString());
      emit(DataErrorState());
    });
  }
}
