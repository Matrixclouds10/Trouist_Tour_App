// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      json['id'] as int?,
      json['full name'] as String?,
      json['email'] as String?,
      json['phone'] as String?,
      json['country_id'] as int?,
      json['city_id'] as int?,
      json['district_id'] as int?,
      json['date_of_birth'] as String?,
      json['fcm_token'] as String?,
      json['avatar'] as String?,
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'country_id': instance.countryId,
      'city_id': instance.cityId,
      'district_id': instance.districtId,
      'date_of_birth': instance.dateBirth,
      'fcm_token': instance.token,
      'avatar': instance.image,
    };
