import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/data/models/country_code_response.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/data/models/terms_response.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/data/repos/sign_up_repo.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/logic/sign_up_state.dart';
import 'package:tourist_tour_app/feature/auth/sign_up/data/models/sign_up_request_body.dart';


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
  bool isChecked=false;
  bool isVisible=true;
  bool isVisibleConfirm=true;
  CountryCodeModel? countryCodeModel;
  TermsResponse? termsResponse;
  var countryChoose='';
  int? countryChooseId;

  void emitSignupStates() async {
    emit(const SignupState.signupLoading());
    final response = await _signupRepo.signup(
      SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        countryId: '1',
      ),
    );
    response.when(success: (signupResponse) {
      if(signupResponse.status==true){
        emit(SignupState.signupSuccess(signupResponse));
      }else{
        emit(SignupState.signupError(error: signupResponse.message!));
      }
    }, failure: (error) {
      emit(SignupState.signupError(error: error.apiErrorModel.message ?? ''));
    });
  }

  void getCountryCode()async{
    emit(const SignupState.signupGetCountryLoading());
    final response = await _signupRepo.getCountryCode();
    response.when(success: (res){
      countryCodeModel =res;
      emit(SignupState.signupGetCountrySuccess(res));
    }, failure: (error){
      emit(SignupState.signupGetCountryError(error: error.apiErrorModel.message ?? ''));
    });
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
