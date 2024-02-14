import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_response.g.dart';
@JsonSerializable()
class ProfileResponse {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'full name')
  String? name;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'phone')
  String? phone;
  @JsonKey(name: 'country_id')
  int? countryId;
  @JsonKey(name: 'city_id')
  int? cityId;
  @JsonKey(name: 'district_id')
  int? districtId;
  @JsonKey(name: 'date_of_birth')
  String? dateBirth;
  @JsonKey(name: 'fcm_token')
  String? token;
  @JsonKey(name: 'avatar')
  String? image;

  ProfileResponse(this.id, this.name, this.email, this.phone, this.countryId,
      this.cityId, this.districtId, this.dateBirth, this.token, this.image);
  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}