part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class LoadingTokenState extends HomeState {}
class SuccessInitHomeState extends HomeState {}
class SuccessChangeIndexState extends HomeState {}
class SuccessGetSliderState extends HomeState {}
class SuccessGetProgramsState extends HomeState {}
class SuccessGetOffersState extends HomeState {}
class SuccessGetTouristPlacesState extends HomeState {}
class ErrorGetOffersState extends HomeState {}
class SuccessSearchState extends HomeState {}
class ErrorSearchState extends HomeState {}
class ErrorGetTouristPlacesState extends HomeState {}
class ErrorGetProgramsState extends HomeState {}
class ErrorGetSliderState extends HomeState {}
class ErrorState extends HomeState {}
class ChangeLoadingState extends HomeState {}
class NotificationLoadingState extends HomeState {}
class NotificationSuccessState extends HomeState {}
class NotificationErrorState extends HomeState {}
class ShowPaymentLoadingState extends HomeState {}
class ShowPaymentSuccessState extends HomeState {
  final String payment;
  ShowPaymentSuccessState({required this.payment});
}
class ShowPaymentErrorState extends HomeState {
  final String error;
  ShowPaymentErrorState({required this.error});
}