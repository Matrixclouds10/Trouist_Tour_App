import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  @JsonKey(name: 'full_name')
  final String name;
  final String email;
  final String phone;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;
  @JsonKey(name: 'country_id')
  final String countryId;

  SignupRequestBody({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.passwordConfirmation,
    required this.countryId,
  });

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
