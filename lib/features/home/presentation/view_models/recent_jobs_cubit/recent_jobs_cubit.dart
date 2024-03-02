import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/constance/constance.dart';
import 'package:jobsque/core/network/remote/dio_helper.dart';
import 'package:jobsque/core/network/remote/endpoints.dart';
import 'package:jobsque/features/home/data/models/job_model/data.dart';
import 'package:meta/meta.dart';

part 'recent_jobs_state.dart';

class RecentJobsCubit extends Cubit<RecentJobsState> {
  RecentJobsCubit() : super(RecentJobsCubitInitial());
  static RecentJobsCubit get(context) => BlocProvider.of(context);

  Future<void> getAllRecentJob() async {
    emit(GetAllRecenttJobsLoading());
    try {
      Response response =
          await DioHelper.getData(endPoint: allJobsURL, token: token);
      if (response.statusCode == 200) {
        List<JobData> recentJobData = [];
        for (var job in response.data['data']) {
          recentJobData.add(JobData.fromJson(job));
        }
        emit(GetAllRecenttJobsSuccessfully(recentJobData: recentJobData));
      }
    } catch (e) {
      emit(GetAllRecenttJobsFailure(errMessage: e.toString()));
    }
  }
}
