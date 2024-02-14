import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/core/resources/bloc/base_cubit.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';
import 'package:tourist_tour_app/core/shared_preference/shared_preference.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:tourist_tour_app/feature/booking/logic/booking_cubit.dart';
import 'package:tourist_tour_app/feature/favorite/logic/favorite_cubit.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/feature/home/data/models/sliders_response.dart';
import 'package:tourist_tour_app/feature/home/data/models/tourist_places_response.dart';
import 'package:tourist_tour_app/feature/home/data/repos/home_repo.dart';
import 'package:tourist_tour_app/feature/more/logic/more_cubit.dart';
part 'home_state.dart';

class HomeCubit extends BaseCubit {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo);
  static HomeCubit get(BuildContext context)=>BlocProvider.of(context);
  List<SlidersResponse>? slidersResponseModel;
  List<ProgramResponse>? programResponseModel;
  List<ProgramResponse>? offersResponseModel;
  List<TouristPlaceResponse>? touristPlacesResponseModel;
  String? token;
  void getToken(BuildContext context) async {
    token= await CacheHelper.getDate(key: 'token');
    print(token);
    Future.delayed(const Duration(microseconds: 0)).then((value) {
      MoreCubit.get(context).getProfile(token!, context);
      FavoriteCubit.get(context).getFavoriteProgram(token!,context.locale.toString(),context);
      BookingCubit.get(context).getBookingPrograms(token!, context,context.locale.toString());
      BookingCubit.get(context).getCanceledPrograms(token!, context,context.locale.toString());
    });

    emit(SuccessStateListener(''));
  }
  int? currentIndex;
  void initHome({String? check, required BuildContext context}){
    HomeCubit.get(context).getToken(context);
    HomeCubit.get(context).getSliderCubit(context);
    HomeCubit.get(context).getPrograms(context.locale.toString());
    HomeCubit.get(context).getOffers(context.locale.toString());
    HomeCubit.get(context).getTouristPlaces(context.locale.toString());
    context.read<SignupCubit>().getCountryCode(context.locale.toString());
    emit(SuccessStateListener(''));
  }
  void initRoot({String? check,}){
    if(check==null){
      currentIndex=0;
    }else{
      currentIndex=int.parse(check).toInt();
    }
  }
  void changeCurrentIndex(int x){
    currentIndex= x;
    emit(SuccessStateListener(''));
  }
  void getSliderCubit(BuildContext context) async {
    emit(LoadingStateListener());
   try{
     final response = await _homeRepo.getSliders();
     slidersResponseModel=response!.data!;
     emit(SuccessStateListener(''));
   }catch(e){
     emit(FailureStateListener(e));
   }
  }
  void getPrograms(String language) async {
    programResponseModel=null;
    emit(LoadingStateListener());
    try{
      final response = await _homeRepo.getPrograms(language);
      programResponseModel=response!.data!;
      emit(SuccessStateListener(''));
    }catch(e){
      emit(FailureStateListener(e));
    }
  }

  void getOffers(String language) async {
    offersResponseModel=null;
    emit(LoadingStateListener());
    try{
      final response = await _homeRepo.getOffers(language);
      offersResponseModel=response!.data!;
      emit(SuccessStateListener(''));
    }catch(e){
      emit(FailureStateListener(e));
    }
  }
  void getTouristPlaces(String language) async {
    touristPlacesResponseModel=null;
    emit(LoadingStateListener());
    try{
      final response = await _homeRepo.getTouristPlaces(language);
      touristPlacesResponseModel=response!.data!;
      emit(SuccessStateListener(''));
    }catch(e){
      emit(FailureStateListener(e));
    }
  }

}
