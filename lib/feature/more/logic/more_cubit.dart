import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/global/toast_states/enums.dart';
import 'package:tourist_tour_app/core/resources/bloc/base_cubit.dart';
import 'package:tourist_tour_app/core/resources/data_state.dart';
import 'package:tourist_tour_app/feature/more/data/models/about_us_response.dart';
import 'package:tourist_tour_app/feature/more/data/models/profile_response.dart';
import 'package:tourist_tour_app/feature/more/data/models/update_profile_request.dart';
import 'package:tourist_tour_app/feature/more/data/repo/more_repo.dart';

class MoreCubit extends BaseCubit {
  final MoreRepo _moreRepo;
  MoreCubit(this._moreRepo);
  static MoreCubit get(BuildContext context)=>BlocProvider.of(context);
  AboutUsResponse? aboutUsResponse;
  AboutUsResponse? termsAppResponse;
  AboutUsResponse? privacyResponse;
  ProfileResponse? profileResponse;
  TextEditingController nameController =TextEditingController();
  TextEditingController phoneController  =TextEditingController();
  TextEditingController emailController  =TextEditingController();
  TextEditingController countryController  =TextEditingController();
  int? countryControllerId;
  final formKey = GlobalKey<FormState>();

  String isLoading ='';
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
  void getProfile(String token ,BuildContext context) async {
    emit(LoadingStateListener());
    try{
      final response = await _moreRepo.getProfile('Bearer $token');
      profileResponse=response!.data!;
       emit(SuccessStateListener(''));
    }catch(e){
      emit(FailureStateListener(e));
    }
  }
  void updateProfile(String token ,BuildContext context) async {
    UpdateProfileRequest updateProfileRequest =UpdateProfileRequest(
        name: nameController.text, phone: phoneController.text,
        email: emailController.text, countryId: countryControllerId!);
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color:AppColorLight.primaryColor,
        ),
      ),
    );
    emit(LoadingStateListener());
    try{
       await _moreRepo.updateProfile('Bearer $token',updateProfileRequest,);
       Future.delayed(const Duration(microseconds: 0)).then((value) {
         getProfile(token,context);
         showToast('Update Successfully', ToastStates.success, context);
       });
      emit(SuccessStateListener(''));

    }catch(e){
      isLoading='stop';
      emit(FailureStateListener(e));
    }
    Future.delayed(const Duration(microseconds: 0)).then((value) {
      Navigator.pop(context);
      Navigator.pop(context);
    });
  }


}
