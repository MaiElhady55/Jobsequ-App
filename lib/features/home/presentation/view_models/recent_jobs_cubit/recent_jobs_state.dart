part of 'recent_jobs_cubit.dart';

@immutable
sealed class RecentJobsState {}

final class RecentJobsCubitInitial extends RecentJobsState {}
//GetAllRecenttJob
class GetAllRecenttJobsLoading extends RecentJobsState {}

class GetAllRecenttJobsSuccessfully extends RecentJobsState {
  final List<JobData> recentJobData;

  GetAllRecenttJobsSuccessfully({required this.recentJobData});
}

class GetAllRecenttJobsFailure extends RecentJobsState {
  final String errMessage;

  GetAllRecenttJobsFailure({required this.errMessage});
}
