import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/core/resources/bloc/base_cubit.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/feature/home/data/models/sliders_response.dart';
import 'package:tourist_tour_app/feature/home/data/models/tourist_places_response.dart';
import 'package:tourist_tour_app/feature/home/data/repos/home_repo.dart';
part 'home_state.dart';

class HomeCubit extends BaseCubit {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo);
  static HomeCubit get(BuildContext context)=>BlocProvider.of(context);
  List<SlidersResponse>? slidersResponseModel;
  List<ProgramResponse>? programResponseModel;
  List<ProgramResponse>? offersResponseModel;
  List<TouristPlaceResponse>? touristPlacesResponseModel;
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
  void getPrograms(String language,BuildContext context) async {
    emit(LoadingStateListener());
    try{
      final response = await _homeRepo.getPrograms(language);
      programResponseModel=response!.data!;
      emit(SuccessStateListener(''));
    }catch(e){
      emit(FailureStateListener(e));
    }
  }

  void getOffers(String language,BuildContext context) async {
    emit(LoadingStateListener());
    try{
      final response = await _homeRepo.getOffers(language);
      offersResponseModel=response!.data!;
      emit(SuccessStateListener(''));
    }catch(e){
      emit(FailureStateListener(e));
    }
  }
  void getTouristPlaces(String language,BuildContext context) async {
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
