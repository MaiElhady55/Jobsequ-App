part of 'suggested_jobs_cubit_cubit.dart';

@immutable
sealed class SuggestedJobsState {}

final class SuggestedJobsInitial extends SuggestedJobsState {}

class GetAllSuggestJobsSuccessfully extends SuggestedJobsState {
  final SuggestedJobModel suggestedJobModel;

  GetAllSuggestJobsSuccessfully({required this.suggestedJobModel});
}

class GetAllSuggestJobsLoading extends SuggestedJobsState {}

class GetAllSuggestJobsFailure extends SuggestedJobsState {
  final String errMessage;

  GetAllSuggestJobsFailure({required this.errMessage});
}
