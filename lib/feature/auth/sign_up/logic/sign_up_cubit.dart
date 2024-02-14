import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/core/global/themeing/app_color/app_color_light.dart';
import 'package:tourist_tour_app/core/routing/routes.dart';
import 'package:tourist_tour_app/core/services/routeing_page/routing.dart';
import 'package:tourist_tour_app/core/shared_preference/shared_preference.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/data/models/country_code_response.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/data/models/terms_response.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/data/repos/sign_up_repo.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/logic/sign_up_state.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/data/models/sign_up_request_body.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/presentation/widget/sign_up_bloc_listener.dart';
import 'package:tourist_tour_app/feature/root_pages/root_page.dart';


class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignupState.initial());
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController countryController = TextEditingController(text: '+20');
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  // List<String> countryList =['Egypt','Sudia Arabi'];
  final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  bool isChecked=false;
  bool isVisible=true;
  bool isVisibleConfirm=true;
  List<CountryResponse>? countryCodeModel;
  TermsResponse? termsResponse;
  var countryChoose='';
  int? countryChooseId;

  void emitSignupStates(context) async {
    emit(const SignupState.signupLoading());
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color:AppColorLight.primaryColor,
        ),
      ),
    );
    final response = await _signupRepo.signup(
      SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        countryId: countryChooseId!.toString(),
      ),
    );
    response.when(success: (signupResponse) {
      if(signupResponse.status==true){
        CacheHelper.saveDate(key: 'token', value:signupResponse.userData!.token!);
        CacheHelper.saveDate(key: 'isLog', value: true);
        // context.pushNamed(Routes.rootScreen);
        NavigatePages.pushReplacePage(RootPages(), context);
        emit(SignupState.signupSuccess(signupResponse));
      }else{
        setupErrorState(context,signupResponse.message!);
        emit(SignupState.signupError(error: signupResponse.message!));
      }
    }, failure: (error) {
      setupErrorState(context,error.apiErrorModel.message??"");
      emit(SignupState.signupError(error: error.apiErrorModel.message ?? ''));
    });
  }

  void getCountryCode(String language)async{
    emit(const SignupState.signupGetCountryLoading());
    try{
      final response = await _signupRepo.getCountryCode(language);
      countryCodeModel =response;
      emit(const SignupState.signupSuccess(''));
      emit(const SignupState.signupGetCountryLoading());
    }catch(e){
      emit(const SignupState.signupGetCountryLoading());
    }

  }

  void getTerms(String language)async{
    try{
      final response = await _signupRepo.getTerms(language);
      termsResponse= response;
      emit(const SignupState.signupGetCountryLoading());
    }catch(e){
      emit(const SignupState.signupGetCountryLoading());
    }
  }
}
