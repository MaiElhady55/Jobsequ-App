import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/constance/constance.dart';
import 'package:jobsque/core/constance/enums.dart';
import 'package:jobsque/core/network/local/cache_helper.dart';
import 'package:jobsque/core/network/remote/dio_helper.dart';
import 'package:jobsque/core/network/remote/endpoints.dart';
import 'package:jobsque/features/home/data/models/job_model/data.dart';
import 'package:jobsque/features/saved_job/data/models/favorite_data.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  List<FavouriteData> favouriteItems = [];

  void getFavouriteJobs() {
    favouriteItems = [];
    emit(GetFavouriteJobsLoading());
    DioHelper.getData(endPoint: favouriteJobsURL, token: token).then((value) {
      for (var job in value.data['data']) {
        favouriteItems.add(FavouriteData.fromJson(job));
        print(job);
      }

      emit(GetFavouriteJobsSuccessfully());
    }).catchError((error) {
      print(error.toString());
      emit(GetFavouriteJobsFailure(error.toString()));
    });
  }

  bool checkFavourite(var id) {
    print('checkkkkkiing');
    for (var job in favouriteItems) {
      if (job.jobId == id) {
        return true;
      }
    }
    return false;
  }

  void addFavourite(JobData job) {
    emit(AddFavouriteJobsLoading());
    DioHelper.postData(token: token, endPoint: favouriteJobsURL, data: {
      'user_id': CachHelper.getData(key: MySharedKeys.userId.toString()),
      'job_id': job.id
    }).then((value) {
      // favouriteItems.add(job);
      getFavouriteJobs();

      print(value.data);
      emit(AddFavouriteJobsSuccessfully());
    }).catchError((error) {
      print(error.toString());
      emit(AddFavouriteJobsFailue(error.toString()));
    });
  }

  removeFavourite(String id) {
    emit(RemoveFavouriteItemLoadingState());
    return DioHelper.deleteData(token: token, endPoint: '$favouriteJobsURL/$id')
        .then((value) {
      //favouriteItems.removeWhere((element) => element.id == job.id);
      getFavouriteJobs();
      emit(RemoveFavouriteItemSuccessfullyState());
    }).catchError((error) {
      print(error.toString());
      print(RemoveFavouriteItemFailurerState(error.toString()));
    });
  }

  handleFavourite(JobData job) {
    if (checkFavourite(job.id!)) {
      removeFavourite(searchFavouriteIdToRemoveItem(job.id!));
    } else {
      addFavourite(job);
    }
  }

  searchFavouriteIdToRemoveItem(int id) {
    for (var job in favouriteItems) {
      if (job.jobId == id) {
        print(job.id.toString());
        print('$favouriteJobsURL/${job.id.toString()}');
        return job.id.toString();
      }
    }
  }

  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }
}
