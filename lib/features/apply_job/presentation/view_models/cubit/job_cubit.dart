import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/constance/enums.dart';
import 'package:jobsque/core/network/local/cache_helper.dart';
import 'package:jobsque/core/network/remote/dio_helper.dart';
import 'package:jobsque/core/network/remote/endpoints.dart';
import 'package:jobsque/features/apply_job/presentation/views/widgets/type_of_work_item_tile.dart';
import 'package:meta/meta.dart';

part 'job_state.dart';

class JobCubit extends Cubit<JobState> {
  JobCubit() : super(JobInitial());

  static JobCubit get(context) => BlocProvider.of(context);

  int activeIndex = 0;
  void changeIndex(index) {
    activeIndex = index;
    emit(ChangeIndexState());
  }

//For Stepper 1 screen
  int currentStep = 0;
  void addStep() {
    currentStep = currentStep + 1;

    print(currentStep);
    emit(ChangeAddStepState());
  }

  void minusStep() {
    currentStep = currentStep - 1;

    print(currentStep);
    emit(ChangeMinusStepState());
  }

//for selecting TypeofWorkTile 2second screen
  int? selectedChoice;
  void selectChoice(value) {
    selectedChoice = value;
    emit(ChangeSelectedChoiceState());
  }

  final List<TypeofWorkTile> typeOfWorkTiles = [
    TypeofWorkTile(
      title: 'Senior UX Designer',
      subtitle: 'CV  Portfolio.pdf',
      value: 1,
    ),
    TypeofWorkTile(
        title: 'Senior UX Designer', subtitle: 'CV  Portfolio.pdf', value: 2),
    TypeofWorkTile(
      title: 'Senior UX Designer',
      subtitle: 'CV  Portfolio.pdf',
      value: 3,
    ),
    TypeofWorkTile(
      title: 'Senior UX Designer',
      subtitle: 'CV  Portfolio.pdf',
      value: 4,
    ),
  ];

//for upload portofolio
  File? selectedCVFile;
  File? selectedOtherFile;

  Future<void> pickFile({required String target}) async {
    emit(PickCVLoading());
    FilePickerResult? pickerResult = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: target == 'CV'
          ? ['pdf']
          : ['jpg', 'png', 'heic', 'jpeg', 'gif', 'svg'],
    );
    if (pickerResult != null) {
      File file = File(pickerResult.files.single.path ?? '');
      if (target == 'CV') {
        selectedCVFile = file;
      } else if (target == 'Other') {
        selectedOtherFile = file;
      }
      emit(PickCVSuccess());
    } else {
      emit(PickCVError());
      return;
    }
  }

  void applyJob(
    String name,
    String email,
    String mobile,
    String jobsId,
  ) async {
    try {
      emit(ApplyJobLoadingState());

      FormData formData = FormData.fromMap({
        'cv_file': await MultipartFile.fromFile(selectedCVFile!.path),
        'name': name,
        'email': email,
        'mobile': mobile,
        'work_type': 'full',
        'other_file': await MultipartFile.fromFile(selectedOtherFile!.path),
        'jobs_id': jobsId,
        'user_id': CachHelper.getData(
            key: MySharedKeys.userId.toString()), // Replace with your user ID
      });
      print('DDDATATATA4444$formData');

      final response =
          await DioHelper.PostFormData(url: applyJobURL, data: formData);

      if (response.statusCode == 200) {
        print(response.data);
        emit(ApplyJobSuccessState());
      } else {
        print('Request failed with status: ${response.statusCode}');
        emit(ApplyJobErrorState());
      }
    } catch (error) {
      print(error);
      emit(ApplyJobErrorState());
    }
  }
}
