import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_profile_request.g.dart';
@JsonSerializable()
class UpdateProfileRequest{
  @JsonKey(name: 'full_name')
  final String name;
  @JsonKey(name: 'phone')
  final String phone;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'country_id')
  final int countryId;

  UpdateProfileRequest({required this.name, required this.phone, required this.email, required this.countryId});
  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);
}