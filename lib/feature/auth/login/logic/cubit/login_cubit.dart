import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourist_tour_app/core/shared_preference/shared_preference.dart';
import 'package:tourist_tour_app/feature/auth/login/data/models/login_request_body.dart';
import 'package:tourist_tour_app/feature/auth/login/data/repos/login_repo.dart';
import 'package:tourist_tour_app/feature/auth/login/logic/cubit/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isVisible= true;


  void emitLoginStates(BuildContext context) async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: phoneController.text,
        password: passwordController.text,
      ),
    );
    response.when(success: (loginResponse) {
      CacheHelper.saveDate(key: 'token', value:loginResponse.userData!.token!);
      emit(LoginState.success(loginResponse));
    }, failure: (error) {
      emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
    });
  }
}
