import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/constance/constance.dart';
import 'package:jobsque/core/network/remote/dio_helper.dart';
import 'package:jobsque/core/network/remote/endpoints.dart';
import 'package:jobsque/features/home/data/models/suggested_job_model/suggested_job_model.dart';
import 'package:meta/meta.dart';

part 'suggested_jobs_cubit_state.dart';

class SuggestedJobsCubit extends Cubit<SuggestedJobsState> {
  SuggestedJobsCubit() : super(SuggestedJobsInitial());
  static SuggestedJobsCubit get(context) => BlocProvider.of(context);

  Future<void> getAllSuggestedJob() async {
    emit(GetAllSuggestJobsLoading());
    try {
      Response response =
          await DioHelper.getData(endPoint: suggestJobsURL, token: token);
      if (response.statusCode == 200) {
        SuggestedJobModel suggestedJobModel =
            SuggestedJobModel.fromJson(response.data);
        emit(GetAllSuggestJobsSuccessfully(
            suggestedJobModel: suggestedJobModel));
      }
    } catch (e) {
      emit(GetAllSuggestJobsFailure(errMessage: e.toString()));
    }
  }
}
