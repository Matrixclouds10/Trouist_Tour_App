import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:tourist_tour_app/core/shared_preference/shared_preference.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/logic/sign_up_cubit.dart';
import 'package:tourist_tour_app/feature/booking/logic/booking_cubit.dart';
import 'package:tourist_tour_app/feature/favorite/logic/favorite_cubit.dart';
import 'package:tourist_tour_app/feature/home/data/models/notification_response.dart';
import 'package:tourist_tour_app/feature/home/data/models/program_response.dart';
import 'package:tourist_tour_app/feature/home/data/models/search_response.dart';
import 'package:tourist_tour_app/feature/home/data/models/sliders_response.dart';
import 'package:tourist_tour_app/feature/home/data/models/tourist_places_response.dart';
import 'package:tourist_tour_app/feature/home/data/repos/home_repo.dart';
import 'package:tourist_tour_app/feature/make_program/logic/make_program_cubit.dart';
import 'package:tourist_tour_app/feature/more/logic/more_cubit.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeInitial());
  static HomeCubit get(BuildContext context)=>BlocProvider.of(context);
  List<SlidersResponse>? slidersResponseModel;
  List<ProgramResponse>? programResponseModel;
  List<ProgramResponse>? offersResponseModel;
  List<TouristPlaceResponse>? touristPlacesResponseModel;
  SearchResponse? searchResponse;
  String? token;
  bool isSearchStart =false;
  TextEditingController searchControllerHome =TextEditingController();

  Future getToken(BuildContext context) async {
    token= await CacheHelper.getDate(key: 'token');
    emit(LoadingTokenState());
    print(token);

    token!=null?
    Future.delayed(const Duration(microseconds: 0)).then((value) {
      HomeCubit.get(context).getPrograms(token!,context.locale.toString());
      HomeCubit.get(context).getTouristPlaces(token!,context.locale.toString());
      MoreCubit.get(context).getProfile(token!, context);
      FavoriteCubit.get(context).getFavoriteProgram(token!,context.locale.toString(),context);
      FavoriteCubit.get(context).getFavoritePlaces(token!,context.locale.toString(),context);
      BookingCubit.get(context).getBookingPrograms(token!, context,context.locale.toString());
      BookingCubit.get(context).getCanceledPrograms(token!, context,context.locale.toString());
      BookingCubit.get(context).getCompletedPrograms(token!, context,context.locale.toString());
    }):
    Future.delayed(const Duration(microseconds: 0)).then((value) {
      HomeCubit.get(context).getPrograms('123',context.locale.toString());
      HomeCubit.get(context).getTouristPlaces('123',context.locale.toString());
    });
    Future.delayed(const Duration(microseconds: 0)).then((value) {
      getLoc();
      MakeProgramCubit.get(context).getPlaces(context);
      HomeCubit.get(context).getSliderCubit(context);
      HomeCubit.get(context).getOffers(context.locale.toString());
      context.read<SignupCubit>().getCountryCode(context.locale.toString());
    });
    emit(LoadingTokenState());
  }
  String location='';
  String? city;
  void getLoc()async{
    Position p ;
    p=await Geolocator.getCurrentPosition().then((value) => value);
    List<Placemark> place= await placemarkFromCoordinates(p.latitude,p.longitude);
    location='${place[0].country}/${place[0].administrativeArea}/${place[0].subAdministrativeArea}${place[0].thoroughfare}${place[0].subThoroughfare}';
    city='${place[0].country}/${place[0].administrativeArea}/${place[0].subAdministrativeArea}';
    emit(SuccessInitHomeState());
  }
  int? currentIndex=0;
  void initHome({String? check, required BuildContext context}){
    getLoc();
    MakeProgramCubit.get(context).getPlaces(context);
    HomeCubit.get(context).getToken(context);
    HomeCubit.get(context).getSliderCubit(context);
    HomeCubit.get(context).getOffers(context.locale.toString());
    context.read<SignupCubit>().getCountryCode(context.locale.toString());
    emit(SuccessInitHomeState());
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
    emit(SuccessChangeIndexState());
  }
  void getSliderCubit(BuildContext context) async {
    try{
      final response = await _homeRepo.getSliders();
      slidersResponseModel=response!.data!;
      emit(SuccessGetSliderState());
    }catch(e){
      emit(ErrorGetSliderState());
    }
  }
  void getPrograms(String token ,String language) async {
    programResponseModel=null;
    try{
      final response = await _homeRepo.getPrograms(token,language);
      programResponseModel=response!.data!;
      emit(SuccessGetProgramsState());
    }catch(e){
      emit(ErrorGetProgramsState());
    }
  }

  void getOffers(String language) async {
    offersResponseModel=null;
    try{
      final response = await _homeRepo.getOffers(language);
      offersResponseModel=response!.data!;
      emit(SuccessGetOffersState());
    }catch(e){
      emit(ErrorGetOffersState());
    }
  }
  void getTouristPlaces(String token,String language) async {
    touristPlacesResponseModel=null;
    try{
      final response = await _homeRepo.getTouristPlaces(token,language);
      touristPlacesResponseModel=response!.data!;
      emit(SuccessGetTouristPlacesState());
    }catch(e){
      emit(ErrorGetTouristPlacesState());
    }
  }
  TextEditingController searchController =TextEditingController();
  void search(String text,BuildContext context) async {
    searchResponse=null;
    try{
      final response = await _homeRepo.search(text,token!,context.locale.languageCode);
      searchResponse=response!.data!;
      emit(SuccessSearchState());
    }catch(e){
      emit(ErrorSearchState());
    }
  }
  void changeSearchStart(bool x){
    isSearchStart=x;
    emit(ChangeLoadingState());
  }
  List<NotificationResponse>? notificationResponse;
  void getNotificationCubit(BuildContext context) async {
    notificationResponse=null;
    emit(NotificationLoadingState());
    final response = await _homeRepo.getNotification(token!);
      response!.when(success: (notificationResponseData) {
        notificationResponse=notificationResponseData.data;
        emit(NotificationSuccessState());
      }, failure: (error) {
        emit(NotificationErrorState());
      });
  }
}
