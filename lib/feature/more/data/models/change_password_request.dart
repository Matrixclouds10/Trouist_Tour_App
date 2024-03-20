import 'package:freezed_annotation/freezed_annotation.dart';
part 'change_password_request.g.dart';
@JsonSerializable()
class ChangePasswordRequest{
  @JsonKey(name: 'password')
  final String? password;
  @JsonKey(name: 'password_confirmation')
  final String? passwordConfirmation;


  ChangePasswordRequest({required this.password,required this.passwordConfirmation});

  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);
}