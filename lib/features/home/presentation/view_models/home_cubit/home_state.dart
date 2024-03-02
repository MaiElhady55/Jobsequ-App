part of '../home_cubit/home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

//GetFavouriteJobs
class GetFavouriteJobsSuccessfully extends HomeState {}

class GetFavouriteJobsLoading extends HomeState {}

class GetFavouriteJobsFailure extends HomeState {
  final String errMessage;

  GetFavouriteJobsFailure(this.errMessage);
}


//AddFavouriteJobs
class AddFavouriteJobsSuccessfully extends HomeState {}

class AddFavouriteJobsLoading extends HomeState {}

class AddFavouriteJobsFailue extends HomeState {
  final String errMessage;

  AddFavouriteJobsFailue(this.errMessage);
}


//RemoveFavouriteItem
class RemoveFavouriteItemLoadingState extends HomeState {}

class RemoveFavouriteItemSuccessfullyState extends HomeState {}

class RemoveFavouriteItemFailurerState extends HomeState {
  final String errMessage;

  RemoveFavouriteItemFailurerState(this.errMessage);
}
