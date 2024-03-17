import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/core/global/toast_states/enums.dart';
import 'package:tourist_tour_app/core/resources/bloc/base_cubit.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';
import 'package:tourist_tour_app/feature/booking/logic/booking_cubit.dart';
import 'package:tourist_tour_app/feature/favorite/data/repo/favorite_repo.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/feature/home/data/models/tourist_places_response.dart';
import 'package:tourist_tour_app/feature/home/logic/home_cubit.dart';
part 'favorite_state.dart';

class FavoriteCubit extends BaseCubit {
  final FavoriteRepo _favoriteRepo;
  FavoriteCubit(this._favoriteRepo);
  static FavoriteCubit get(BuildContext context)=>BlocProvider.of(context);
  List<ProgramResponse>? getFavoriteList;
  List<TouristPlaceResponse>? getFavoritePlacesList;

  void addFavoriteProgram(int id,String token ,String language,BuildContext context) async {
    emit(LoadingStateListener());
    try{
      final response = await _favoriteRepo.addFavoriteProgram(id,'Bearer $token');
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast('${response.message}', ToastStates.success, context);
        getFavoriteProgram(token, language,context,);
        BookingCubit.get(context).getBookingPrograms(token, context, language);
        BookingCubit.get(context).getCanceledPrograms(token, context, language);
        HomeCubit.get(context).getPrograms(HomeCubit.get(context).token!,language);
      });
      emit(SuccessStateListener(''));
    }catch(e){
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast('$e', ToastStates.error, context);
      });
      emit(FailureStateListener(e));
    }
  }

  void getFavoriteProgram(String token ,String language,BuildContext context) async {

    emit(LoadingStateListener());
    try{
      final response = await _favoriteRepo.getFavoriteProgram('Bearer $token',language);
      getFavoriteList=response.data!;
      emit(SuccessStateListener(''));
    }catch(e){
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast('$e', ToastStates.error, context);
      });
      emit(FailureStateListener(e));
    }
  }

  void addFavoritePlaces(int id,String token ,String language,BuildContext context) async {
    emit(LoadingStateListener());
    try{
      final response = await _favoriteRepo.addFavoritePlaces(id,'Bearer $token');
      if(response.status==true){

      }else{
        Future.delayed(const Duration(microseconds: 0)).then((value) {
          showToast('${response.message}', ToastStates.error, context);
        });
      } Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast('${response.message}', ToastStates.success, context);
        getFavoritePlaces(token, language,context,);
        HomeCubit.get(context).getTouristPlaces(HomeCubit.get(context).token!,language);
      });
      emit(SuccessStateListener(''));
    }catch(e){
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast('$e', ToastStates.error, context);
      });
      emit(FailureStateListener(e));
    }
  }

  void getFavoritePlaces(String token ,String language,BuildContext context) async {
    emit(LoadingStateListener());
    try{
      final response = await _favoriteRepo.getFavoritePlaces('Bearer $token',language);
      getFavoritePlacesList=response.data!;
      emit(SuccessStateListener(''));
    }catch(e){
      Future.delayed(const Duration(microseconds: 0)).then((value) {
        showToast('$e', ToastStates.error, context);
      });
      emit(FailureStateListener(e));
    }
  }
}
