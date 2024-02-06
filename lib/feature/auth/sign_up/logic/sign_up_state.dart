import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.freezed.dart';

@freezed
class SignupState<T> with _$SignupState<T> {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.signupLoading() = SignupLoading;
  const factory SignupState.signupGetCountryLoading() = SignupGetCountryLoading;
  const factory SignupState.signupGetCountrySuccess(T data) = SignupGetCountrySuccess<T>;
  const factory SignupState.signupSuccess(T data) = SignupSuccess<T>;
  const factory SignupState.signupError({required String error}) = SignupError;
  const factory SignupState.signupGetCountryError({required String error}) = SignupGetCountryError;
}

