import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/core/resources/bloc/base_cubit.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';
import 'package:tourist_tour_app/feature/more/data/models/about_us_response.dart';
import 'package:tourist_tour_app/feature/more/data/repo/more_repo.dart';

class MoreCubit extends BaseCubit {
  final MoreRepo _moreRepo;
  MoreCubit(this._moreRepo);
  static MoreCubit get(BuildContext context)=>BlocProvider.of(context);
  AboutUsResponse? aboutUsResponse;
  AboutUsResponse? termsAppResponse;
  AboutUsResponse? privacyResponse;


  void getAboutUs(String language ,BuildContext context) async {
    aboutUsResponse=null;
    emit(LoadingStateListener());
    try{
      final response = await _moreRepo.getAboutUs(language);
      aboutUsResponse=response!.data!;
      emit(SuccessStateListener(''));
    }catch(e){
      emit(FailureStateListener(e));
    }
  }
  void getTermsApp(String language ,BuildContext context) async {
    termsAppResponse=null;
    emit(LoadingStateListener());
    try{
      final response = await _moreRepo.getTermsApp(language);
      termsAppResponse=response!.data!;
      emit(SuccessStateListener(''));
    }catch(e){
      emit(FailureStateListener(e));
    }
  }
  void getPrivacy(String language ,BuildContext context) async {
    privacyResponse=null;
    emit(LoadingStateListener());
    try{
      final response = await _moreRepo.getPrivacy(language);
      privacyResponse=response!.data!;
      emit(SuccessStateListener(''));
    }catch(e){
      emit(FailureStateListener(e));
    }
  }


}
