import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/constance/constance.dart';
import 'package:jobsque/core/constance/enums.dart';
import 'package:jobsque/core/network/local/cache_helper.dart';
import 'package:jobsque/core/network/remote/dio_helper.dart';
import 'package:jobsque/core/network/remote/endpoints.dart';
import 'package:jobsque/features/applied_job/data/models/applied_job_model.dart';
import 'package:jobsque/features/home/data/models/job_model/data.dart';
import 'package:meta/meta.dart';

part 'applied_job_state.dart';

class AppliedJobCubit extends Cubit<AppliedJobState> {
  AppliedJobCubit() : super(AppliedJobInitial());

  static AppliedJobCubit get(context) => BlocProvider.of(context);

  int activeIndex = 0;
  changeIndex(index) {
    activeIndex = index;
    emit(ChangeIndex());
  }

  List<JobData> appliedJobsData = [];

  void getAppliedJobs({required String jobId}) {
    emit(GetAppliedJobsLoading());
    DioHelper.getData(token: token, endPoint: '$allJobsURL/$jobId')
        .then((value) {
      appliedJobsData.add(JobData.fromJson(value.data['data']));

      if (appliedJobsData.isEmpty) {
        emit(AppliedJobEmpty());
      } else {
        emit(GetAppliedJobsSuccessfully());
      }
    }).catchError((error) {
      print(error.toString());
      emit(GetAppliedJobsError());
    });
  }

  void getAppliedJobsId() {
    emit(GetAppliedJobsIDLoading());
    DioHelper.getData(
            token: token,
            endPoint:
                '$applyJobURL/${CachHelper.getData(key: MySharedKeys.userId.toString())}')
        .then((value) {
      if (value.data['data'].isEmpty) {
        emit(AppliedJobEmpty());
        // print('yes');
      } else {
        for (var job in value.data['data']) {
          String id = AppliedJobData.fromJson(job).jobsId.toString();
          getAppliedJobs(jobId: id);
        }
        emit(GetAppliedJobsIDSuccessfully());
      }
    }).catchError((error) {
      print(error.toString());
      emit(GetAppliedJobsIDError());
    });
  }
}
